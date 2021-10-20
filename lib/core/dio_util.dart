import 'package:dio/dio.dart';

class DioUtil {
  static late Dio dio;
  static DioUtil? _instance;

  static DioUtil? getInstance() {
    if(_instance == null){
      dio = Dio(
        BaseOptions(
          baseUrl: "https://api.foursquare.com/v2/venues/",
          receiveDataWhenStatusError: true,
          connectTimeout: 30 * 10000,
          receiveTimeout: 30 * 10000,
        ),
      );
    }
    return _instance;
  }
}
