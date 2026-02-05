import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/config/dependencies.dart';

part 'weather_api_client.g.dart';

@riverpod
WeatherAPIClient weatherAPIClient(Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  return WeatherAPIClient(dio);
}

class WeatherAPIClient {
  final Dio _dio;

  WeatherAPIClient(this._dio);

  
}
