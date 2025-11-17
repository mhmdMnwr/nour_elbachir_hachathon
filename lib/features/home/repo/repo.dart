import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nour_elbachir_hackathon/features/home/service/service.dart';

class HomeRepo {
  final HomeService _service;

  HomeRepo({required HomeService service}) : _service = service;

  // Fetch data - replace dynamic with your actual model type
  Future<Either<String, dynamic>> fetchData({required String endpoint}) async {
    try {
      final response = await _service.fetchData(endpoint: endpoint);

      // TODO: Parse response.data to your model
      // Example: final model = YourModel.fromJson(response.data);

      return Right(response.data);
    } catch (e) {
      return Left(_extractErrorMessage(e));
    }
  }

  // Post data - replace dynamic with your actual model type
  Future<Either<String, dynamic>> postData({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _service.postData(endpoint: endpoint, data: data);

      // TODO: Parse response.data to your model
      // Example: final model = YourModel.fromJson(response.data);

      return Right(response.data);
    } catch (e) {
      return Left(_extractErrorMessage(e));
    }
  }

  // Extract error message from backend response
  String _extractErrorMessage(dynamic error) {
    if (error is DioException) {
      // Try to get error message from backend response
      if (error.response?.data != null) {
        final data = error.response!.data;

        // Check common error message fields from backend
        if (data is Map) {
          if (data.containsKey('message')) {
            return data['message'].toString();
          }
          if (data.containsKey('error')) {
            return data['error'].toString();
          }
          if (data.containsKey('msg')) {
            return data['msg'].toString();
          }
        }

        // If data is a string, return it
        if (data is String) {
          return data;
        }
      }

      // Fallback for network errors
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return 'Connection timeout';
      }
      if (error.type == DioExceptionType.connectionError) {
        return 'No internet connection';
      }
    }

    return 'An error occurred';
  }
}
