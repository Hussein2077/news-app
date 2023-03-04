import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsdata.io',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}

class CacheHelper
{
  static late SharedPreferences sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async
  {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean({
    required String key,
  })
  {
    return sharedPreferences.getBool(key);
  }
}