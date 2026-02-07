import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_api_model.freezed.dart';
part 'current_weather_api_model.g.dart';

@freezed
abstract class CurrentWeatherApiModel with _$CurrentWeatherApiModel {
  const factory CurrentWeatherApiModel({
    required int id,
    String? name,
    String? country,
    String? icon,
    String? description,
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? visibility,
    double? windSpeed,
    double? windDeg,
    double? cloudiness,
    double? sunrise,
    double? sunset,
  }) = _CurrentWeatherApiModel;

  factory CurrentWeatherApiModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherApiModelFromJson(json);
}
