import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend_chatbot/core/constants/constants.dart';
import 'package:logger/logger.dart';

class ApiService {
  late final Dio _dio;
  final Logger _logger = Logger();

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppString.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => _logger.d(obj),
      ),
    );
  }

  /// Get Firebase ID token for authentication
  Future<String?> _getFirebaseToken() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return await user.getIdToken();
      }
      return null;
    } catch (e) {
      _logger.e('Error getting Firebase token: $e');
      return null;
    }
  }

  /// Health check endpoint
  Future<Map<String, dynamic>> healthCheck() async {
    try {
      final response = await _dio.get('/health');
      return response.data;
    } catch (e) {
      _logger.e('Health check failed: $e');
      rethrow;
    }
  }

  /// Explain math concept
  Future<Map<String, dynamic>> explainMath({
    required String query,
    String locale = 'en',
    String? model,
  }) async {
    try {
      final token = await _getFirebaseToken();
      if (token == null) {
        throw Exception('User not authenticated');
      }

      final response = await _dio.post(
        '/api/explain',
        data: {
          'query': query,
          'locale': locale,
          if (model != null) 'model': model,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data;
    } catch (e) {
      _logger.e('Explain math failed: $e');
      rethrow;
    }
  }
}
