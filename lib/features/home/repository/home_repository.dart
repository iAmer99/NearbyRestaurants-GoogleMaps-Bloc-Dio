import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearbyrestaurants/core/dio_util.dart';
import 'package:nearbyrestaurants/features/home/repository/models/general_response.dart';
import 'package:nearbyrestaurants/features/home/repository/models/restaurant.dart';

class HomeRepository {
  final Dio _dio = DioUtil.dio;

  Future<Either<String, List<Restaurant>>> getNearbyRestaurants(String currentDate, String lat, String lng) async{
    try{
      final response = await _dio.get("/search", queryParameters: {
        "client_id" : "LDGWCTNOER1UWXPWWAF4YS5CUSEWLZRUXDF0ZUYZTHACWV2G",
        "client_secret" : "0PUIVKMHKNQ0M41XSFWZLKP512FZ5PQ55S20QKWQTKYGGHEC",
        "categoryId" : "4d4b7105d754a06374d81259",
        "limit" : 50,
        "v": currentDate,
        "ll": "$lat,$lng",
      });
      final data = GeneralResponse.fromJson(response.data);
      return Right(data.response!.restaurants!);
    }catch(error){
      if(error is DioError){
        debugPrint(error.message);
      }else{
        debugPrint(error.toString());
      }
      return const Left("Something went wrong!");
    }
  }
}