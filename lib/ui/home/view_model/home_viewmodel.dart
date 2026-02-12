import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/data/repositories/forecast/forecast_repository_remote.dart';
import 'package:weather_app/data/services/api/model/current_weather/current_weather_api_model.dart';
import 'package:weather_app/utils/result.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<CurrentWeatherApiModel?> build() {
    return null;
  }

  Future<void> getForecast(String city) async {
    state = const AsyncValue.loading();

    final repository = ref.read(forecastRepositoryLocalProvider);

    final result = await repository.getForecast(city);
    result.when(
      ok: (weatherData) {
        state = AsyncValue.data(weatherData);
      },
      error: (exception) {
        state = AsyncValue.error(exception, StackTrace.current);
      },
    );
  }
}
