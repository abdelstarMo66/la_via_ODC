import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String? url,
    String? token,
    required Map<String, dynamic>? Data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.post(
      url!,
      data: Data,
    );
  }

  static Future<Response> getData({
    required String url,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final Response response = await dio.get(
        url,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
