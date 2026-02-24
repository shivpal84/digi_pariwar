import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  String _token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2OTc0NzU5YzMxN2Y4MzA1ZDAzOTJjODEiLCJpYXQiOjE3NzE3Mzc0MjAsImV4cCI6MTc3MjM0MjIyMH0.mv4_qhNGoyxdNNkRmb-6uxQI9f0m9OLHlXIPfNwxNpQ";

  ApiClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: "https://api.digiparivaar.com",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  ) {
    _initializeInterceptors();
  }

  /// 🔐 Set token dynamically
  void setToken(String token) {
    _token = token;
  }

  void _initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_token != null) {
            options.headers["Authorization"] =  "Bearer $_token";
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            // 🔥 Handle unauthorized globally
            // Later: logout user / refresh token
            print("Unauthorized - Token expired");
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data["message"] ?? "Network Error",
      );
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await dio.post(path, data: data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data["message"] ?? "Network Error",
      );
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await dio.put(path, data: data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data["message"] ?? "Network Error",
      );
    }
  }
}