import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nearbyrestaurants/core/dio_util.dart';
import 'package:nearbyrestaurants/features/home/home_screen.dart';
import 'package:nearbyrestaurants/utils/size_config.dart';

import 'core/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            init(constraints, orientation);
            return MaterialApp(
              title: 'Nearby Restaurants',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}
