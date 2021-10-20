import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearbyrestaurants/features/home/cubit/home_cubit.dart';
import 'package:nearbyrestaurants/features/home/cubit/home_states.dart';
import 'package:nearbyrestaurants/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late Uint8List markerBytes;

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      _controller.complete(controller);
    }
  }

  void _createCustomIcon() async {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(1.5 * imageSizeMultiplier, 1.5 * imageSizeMultiplier),
        ),
        'assets/restaurant.png');
  }

  Future<void> _getBytesFromAsset(String path, double width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width.toInt());
    ui.FrameInfo fi = await codec.getNextFrame();
    markerBytes = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    _getBytesFromAsset('assets/restaurant.png', 40 * imageSizeMultiplier);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentLocation(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (ctx, state) {
          final HomeCubit cubit = HomeCubit.get(ctx);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Nearby Restaurants"),
              centerTitle: true,
            ),
            body: state is HomeLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GoogleMap(
                        initialCameraPosition: cubit.cameraPosition,
                        onMapCreated: _onMapCreated,
                        markers: cubit.restaurants
                            .map(
                              (restaurant) => Marker(
                                markerId: MarkerId(restaurant.id!),
                                position: LatLng(restaurant.location!.lat!,
                                    restaurant.location!.lng!),
                                icon: BitmapDescriptor.fromBytes(markerBytes),
                                onTap: () {
                                  cubit.onMarkerTap(restaurant);
                                },
                              ),
                            )
                            .toSet(),
                        mapType: MapType.terrain,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        onTap: (_) {
                          cubit.hideCard();
                        },
                        onCameraMove: (CameraPosition position) =>
                            cubit.onMapMoved(
                          position.target.latitude.toString(),
                          position.target.longitude.toString(),
                        ),
                        onCameraIdle: () => cubit.onMapMoveEnds(state),
                      ),
                      if (state is HomeRestaurantTapedState)
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 4 * heightMultiplier,
                            horizontal: 3 * widthMultiplier,
                          ),
                          width: double.infinity,
                          height: 20 * heightMultiplier,
                          child: Card(
                            color: Colors.white,
                            elevation: 1.5 * heightMultiplier,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                1.5 * heightMultiplier,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/restaurant.svg',
                                  height: 15 * heightMultiplier,
                                  color: Colors.teal,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          cubit.selectedRestaurant.name!,
                                          style: TextStyle(
                                            fontSize: 2.5 * textMultiplier,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(cubit
                                            .selectedRestaurant.location!.address!, style: TextStyle(
                                          fontSize: 2 * textMultiplier,
                                        ),),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
