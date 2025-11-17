import 'package:dio/dio.dart';
import 'package:nour_elbachir_hackathon/core/helper/dio.dart';
import 'package:nour_elbachir_hackathon/features/home/repo/repo.dart';
import 'package:nour_elbachir_hackathon/features/home/service/service.dart';

class DependencyInjection {
  DependencyInjection._();

  // Singleton instances
  static Dio? _dio;
  static HomeService? _homeService;
  static HomeRepo? _homeRepo;

  // Get Dio instance
  static Dio get dio {
    _dio ??= DioFactory.getDio();
    return _dio!;
  }

  // Get HomeService instance
  static HomeService get homeService {
    _homeService ??= HomeService(dio: dio);
    return _homeService!;
  }

  // Get HomeRepo instance
  static HomeRepo get homeRepo {
    _homeRepo ??= HomeRepo(service: homeService);
    return _homeRepo!;
  }

  // Reset all instances (useful for testing)
  static void reset() {
    _dio = null;
    _homeService = null;
    _homeRepo = null;
  }
}
