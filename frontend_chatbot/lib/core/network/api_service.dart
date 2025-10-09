import 'dart:io';
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
    required String prompt,
    String locale = 'en',
    String? model,
    List<File> imageFiles = const [],
  }) async {
    try {
      if (prompt.trim().isEmpty) {
        throw Exception('Prompt cannot be empty');
      }

      final validModels = ['openai', 'gemini'];
      final selectedModel = model ?? 'openai';
      if (!validModels.contains(selectedModel)) {
        throw Exception(
          'Invalid model: $selectedModel. Must be one of: ${validModels.join(', ')}',
        );
      }

      final token = await _getFirebaseToken();
      if (token == null) {
        throw Exception('User not authenticated');
      }

      // Chuẩn hóa list ảnh
      List<MultipartFile> filesList = [];
      if (imageFiles.isNotEmpty) {
        filesList = [
          for (final f in imageFiles)
            MultipartFile.fromFileSync(
              f.path,
              filename: f.path.split('/').last,
            ),
        ];
      }

      // FormData: chỉ include 'images' khi có ảnh
      final formData = FormData.fromMap({
        'prompt': prompt,
        'locale': locale,
        'model': selectedModel,
        if (filesList.isNotEmpty) 'images': filesList,
      });

      // Debug
      _logger.d('Sending request to /api/explain');
      _logger.d('Prompt: $prompt');
      _logger.d('Locale: $locale');
      _logger.d('Model: $selectedModel');
      _logger.d('Image files count: ${imageFiles.length}');

      final response = await _dio.post(
        '/api/explain',
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      _logger.d('Response received successfully');
      return response.data;
    } catch (e) {
      _logger.e('Explain math failed: $e');
      if (e is DioException) {
        _logger.e('DioException details:');
        _logger.e('  Status code: ${e.response?.statusCode}');
        _logger.e('  Response data: ${e.response?.data}');
        _logger.e('  Request data: ${e.requestOptions.data}');
        _logger.e('  Request headers: ${e.requestOptions.headers}');
      }
      rethrow;
    }
  }
}
