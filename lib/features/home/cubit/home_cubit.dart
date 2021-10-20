import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearbyrestaurants/features/home/cubit/home_states.dart';
import 'package:nearbyrestaurants/features/home/repository/home_repository.dart';
import 'package:nearbyrestaurants/features/home/repository/models/restaurant.dart';
import 'package:nearbyrestaurants/utils/helper_functions.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final HomeRepository _repository = HomeRepository();

  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  List<Restaurant> restaurants = [];
  String currentLat = "";
  String currentLng = "";
  bool hasMoved = false;
  Restaurant selectedRestaurant = Restaurant(name: "");

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(30.357519, 31.204611),
    zoom: 14,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location repository are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future getCurrentLocation() async {
    emit(HomeLoadingState());
    final Position _position = await _determinePosition();
    cameraPosition = CameraPosition(
      target: LatLng(_position.latitude, _position.longitude),
      zoom: 14,
      bearing: 0.0,
    );
    String currentDate = "${DateTime.now().year}" +
        getDoubledDayMonth(DateTime.now().month.toString()) +
        getDoubledDayMonth(DateTime.now().day.toString());
    final response = await _repository.getNearbyRestaurants(currentDate,
        _position.latitude.toString(), _position.longitude.toString());
    response.fold((error) {
      emit(HomeErrorState(error));
    }, (data) {
      if (restaurants.isEmpty) {
        restaurants = data;
        emit(HomeSuccessState());
      } else {
        restaurants.addAll(data.where(
            (element) => restaurants.any((element2) => element != element2)));
        emit(HomeSuccessState());
      }
    });
  }

  onMapMoved(String lat, String lng) {
    currentLat = lat;
    currentLng = lng;
    cameraPosition = CameraPosition(target: LatLng(double.parse(lat),double.parse(lng)), zoom: 14);
    hasMoved = true;
  }

  Future onMapMoveEnds(HomeStates prevState) async {
    if (hasMoved) {
      String currentDate = "${DateTime.now().year}" +
          getDoubledDayMonth(DateTime.now().month.toString()) +
          getDoubledDayMonth(DateTime.now().day.toString());
      final response = await _repository.getNearbyRestaurants(
          currentDate, currentLat, currentLng);
      response.fold((error) {
        if(prevState is HomeRestaurantTapedState){
          emit(HomeRestaurantTapedState());
        }else{
          emit(HomeErrorState(error));
        }
      }, (data) {
        hasMoved = false;
        if (restaurants.isEmpty) {
          restaurants = data;
        } else {
          restaurants.addAll(data.where(
              (element) => restaurants.any((element2) => element != element2)));
        }
        if(prevState is HomeRestaurantTapedState){
          emit(HomeRestaurantTapedState());
        }else{
          emit(HomeSuccessState());
        }
      });
    }
  }

  onMarkerTap(Restaurant restaurant){
    selectedRestaurant = restaurant;
    emit(HomeRestaurantTapedState());
  }

  hideCard(){
    emit(HomeCardHiddenState());
  }
}
