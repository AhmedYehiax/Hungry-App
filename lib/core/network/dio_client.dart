import 'package:dio/dio.dart';
import 'package:hungry/core/utils/pref_helpers.dart';
class DioClient {
  final Dio _dio= Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );




DioClient(){
  _dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async{
        final token = await PrefHelpers.getUserToken(); // Retrieve your token from secure storage or any other source
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },

    )
  );
}


  Dio get client => _dio;
}