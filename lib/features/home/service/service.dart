import 'package:dio/dio.dart';

class HomeService {
  final Dio _dio;

  HomeService({required Dio dio}) : _dio = dio;

  // Fetch data (GET request)
  Future<Response> fetchData({required String endpoint}) async {
    final response = await _dio.get(endpoint);
    return response;
  }

  // Post data
  Future<Response> postData({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(endpoint, data: data);
    return response;
  }
}
