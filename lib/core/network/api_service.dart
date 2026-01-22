import 'package:dio/dio.dart';
import 'package:hungry/core/network/api.exceptions.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiService {

  final DioClient _dioClient = DioClient();

  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.client.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
   Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final response = await _dioClient.client.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }


   Future<dynamic> put(String endPoint, dynamic body) async {
    try {
      final response = await _dioClient.client.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

 Future<dynamic> delete(String endPoint, dynamic body) async {
    try {
      final response = await _dioClient.client.delete(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}