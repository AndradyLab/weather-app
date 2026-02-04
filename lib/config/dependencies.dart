import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/config/env.dart';

part 'dependencies.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final options = BaseOptions(
    baseUrl: Env.apiUrl, 
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    contentType: Headers.jsonContentType,
  );
  final dio = Dio(options);
  
  dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Log para conferir se está batendo no lugar certo
        print('🚀 [DIO] Request: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        print('❌ [DIO] Erro: ${e.response?.statusCode} - ${e.message}');
        return handler.next(e);
      },
      onResponse: (response, handler) {
        print('✅ [DIO] Sucesso: ${response.statusCode}');
        return handler.next(response);
      },
    ));
  
  return dio;
}
