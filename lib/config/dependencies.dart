import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:envied/envied.dart';

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

@Envied(path: '.env.dev', obfuscate: true)
abstract class Env {
  @EnviedField(
    varName: 'API_URL',
    obfuscate: true,
  )
  static final String apiUrl = _Env.apiUrl;
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final logger = ref.watch(loggerProvider);
  final options = BaseOptions(
    baseUrl: Env.apiUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    contentType: Headers.jsonContentType,
  );
  final dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    //TODO: CRIAR OS INTERCEPTORES NA PASTA UTILS, os principais são o de error o de response pode ser pensado mas de forma geral quem faz é o repositorie.
    onRequest: (options, handler) {
      // Log para conferir se está batendo no lugar certo
      logger.i("Teste: ${options.baseUrl}");
      logger.d('🚀 [DIO] Request: ${options.method} ${options.path}');
      return handler.next(options);
    },
    onError: (DioException e, handler) {
      logger.e('❌ [DIO] Erro: ${e.response?.statusCode} - ${e.message}');
      return handler.next(e);
    },
    onResponse: (response, handler) {
      logger.i('✅ [DIO] Sucesso: ${response.statusCode}');
      return handler.next(response);
    },
  ));

  return dio;
}

@Riverpod(keepAlive: true)
Logger logger(Ref ref) {
  return Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
      level: kDebugMode ? Level.debug : Level.error);
}
