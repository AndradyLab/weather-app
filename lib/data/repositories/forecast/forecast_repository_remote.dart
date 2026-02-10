import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/data/repositories/forecast/forecast_repository.dart';
import 'package:weather_app/data/services/api/model/current_weather/current_weather_api_model.dart';
import 'package:weather_app/data/services/api/weather_api_client.dart';
import 'package:weather_app/utils/result.dart';

part 'forecast_repository_remote.g.dart';

@riverpod
ForecastRepositoryLocal forecastRepositoryLocal(Ref ref) {
  final weatherService = ref.watch(weatherAPIClientProvider);
  return ForecastRepositoryLocal(weatherService);
}

class ForecastRepositoryLocal implements ForecastRepository {
  ForecastRepositoryLocal(this._weatherService);

  final WeatherAPIClient _weatherService;

  @override
  Future<Result<CurrentWeatherApiModel>> getForecast(String city) async {
    try {
      return await _weatherService.fetchForecast(city);

    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}
