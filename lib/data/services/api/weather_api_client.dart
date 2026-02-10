import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/config/dependencies.dart';
import 'package:weather_app/data/services/api/endpoints/weather_endpoints.dart';
import 'package:weather_app/data/services/api/model/current_weather/current_weather_api_model.dart';
import 'package:weather_app/data/services/api/model/history/history_api_model.dart';
import 'package:weather_app/utils/result.dart';

part 'weather_api_client.g.dart';

@riverpod
WeatherAPIClient weatherAPIClient(Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  return WeatherAPIClient(dio);
}

class WeatherAPIClient {
  final Dio _dio;

  WeatherAPIClient(this._dio);

  Future<Result<CurrentWeatherApiModel>> fetchForecast(String location) async {
    try {
      final result = await _dio.get(WeatherEndpoints.forecast, queryParameters: {'q': location});
      if (result.statusCode != 200) {
        return Result.error(Exception('Failed to fetch forecast'));
      }

      return Result.ok(CurrentWeatherApiModel.fromJson(result.data));
    } on Exception catch (err) {
      return Result.error(Exception('Unexpected error: ${err.toString()}'));
    }
  }

  Future<Result<HistoryApiModel>> fetchHistory(String location, String formattedDate) async {
    try {
      final result = await _dio.get(WeatherEndpoints.history, queryParameters: {'q': location, 'dt': formattedDate});
      if (result.statusCode != 200) {
        return Result.error(Exception('Failed to fetch history'));
      }

      return Result.ok(HistoryApiModel.fromJson(result.data));
    } on Exception catch (err) {
      return Result.error(Exception('Unexpected error: ${err.toString()}'));
    }
  }
}
