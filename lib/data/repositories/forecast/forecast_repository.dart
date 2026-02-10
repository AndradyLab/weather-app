import 'package:weather_app/data/services/api/model/current_weather/current_weather_api_model.dart';
import 'package:weather_app/utils/result.dart';

abstract class ForecastRepository {
  Future<Result<CurrentWeatherApiModel>> getForecast(String city) async;
}