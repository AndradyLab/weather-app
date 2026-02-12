import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_api_model.freezed.dart';
part 'current_weather_api_model.g.dart';

@freezed
abstract class CurrentWeatherApiModel with _$CurrentWeatherApiModel {
  @JsonSerializable(explicitToJson: true)
  const factory CurrentWeatherApiModel({
    required Location location,
    required Current current,
    Forecast? forecast,
  }) = _CurrentWeatherApiModel;

  factory CurrentWeatherApiModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherApiModelFromJson(json);
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    required String name,
    String? region,
    String? country,
    @JsonKey(name: "lat") double? latitude,
    @JsonKey(name: "lon") double? longitude,
    @JsonKey(name: "tz_id") String? tzId,
    @JsonKey(name: "location_epoch") int? locationtimeEpoch,
    String? localtime,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
abstract class Current with _$Current {

  @JsonSerializable(explicitToJson: true)
  const factory Current({
    @JsonKey(name: "last_updated_epoch") int? lastUpdatedEpoch,
    @JsonKey(name: "last_updated") String? lastUpdated,
    @JsonKey(name: "temp_c") double? tempC,
    @JsonKey(name: "temp_f") double? tempF,
    @JsonKey(name: "is_day") int? isDay,
    required Condition condition,
    @JsonKey(name: "wind_mph") double? windMph,
    @JsonKey(name: "wind_kph") double? windKph,
    @JsonKey(name: "wind_degree") int? windDegree,
    @JsonKey(name: "wind_dir") String? windDir,
    @JsonKey(name: "pressure_mb") double? pressureMb,
    @JsonKey(name: "pressure_in") double? pressureIn,
    @JsonKey(name: "precip_mm") double? precipMm,
    @JsonKey(name: "precip_in") double? precipIn,
    int? humidity,
    int? cloud,
    @JsonKey(name: "feelslike_c") double? feelslikeC,
    @JsonKey(name: "feelslike_f") double? feelslikeF,
    @JsonKey(name: "windchill_c") double? windchillC,
    @JsonKey(name: "windchill_f") double? windchillF,
    @JsonKey(name: "heatindex_c") double? heatindexC,
    @JsonKey(name: "heatindex_f") double? heatindexF,
    @JsonKey(name: "dewpoint_c") double? dewpointC,
    @JsonKey(name: "dewpoint_f") double? dewpointF,
    @JsonKey(name: "vis_km") double? visKm,
    @JsonKey(name: "vis_miles") double? visMiles,
    double? uv,
    @JsonKey(name: "gust_mph") double? gustMph,
    @JsonKey(name: "gust_kph") double? gustKph,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}

@freezed
abstract class Condition with _$Condition {
  const factory Condition({
    required String text,
    required String icon,
    required int code,
  }) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);
}

@freezed
abstract class Forecast with _$Forecast {
  @JsonSerializable(explicitToJson: true)
  const factory Forecast({
    @JsonKey(name: "forecastday") required List<ForecastDay> forecastDays,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);
}

@freezed
abstract class ForecastDay with _$ForecastDay {
  @JsonSerializable(explicitToJson: true)
  const factory ForecastDay({
    required String date,
    @JsonKey(name: "date_epoch") int? dateEpoch,
    required Day day,
    required Astro astro,
    required List<Hour> hour,
    
  }) = _ForecastDay;

  factory ForecastDay.fromJson(Map<String, dynamic> json) => _$ForecastDayFromJson(json);
}

@freezed
abstract class Day with _$Day {
  @JsonSerializable(explicitToJson: true)
  const factory Day({
    @JsonKey(name: "maxtemp_c") double? maxTempC,
    @JsonKey(name: "maxtemp_f") double? maxTempF,
    @JsonKey(name: "mintemp_c") double? minTempC,
    @JsonKey(name: "mintemp_f") double? minTempF,
    @JsonKey(name: "avgtemp_c") double? avgTempC,
    @JsonKey(name: "avgtemp_f") double? avgTempF,
    @JsonKey(name: "maxwind_kph") double? maxWindKph,
    @JsonKey(name: "totalprecip_mm") double? totalPrecipMm,
    @JsonKey(name: "avghumidity") int? avgHumidity,
    @JsonKey(name: "daily_will_it_rain") int? dailyWillItRain,
    @JsonKey(name: "daily_chance_of_rain") int? dailyChanceOfRain, 
    required Condition condition,
    
    double? uv,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
abstract class Astro with _$Astro {
  const factory Astro({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    @JsonKey(name: "moon_phase") String? moonPhase,
    @JsonKey(name: "moon_illumination") int? moonIllumination,
  }) = _Astro;

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);
}

@freezed
abstract class Hour with _$Hour {
  @JsonSerializable(explicitToJson: true)
  const factory Hour({
    @JsonKey(name: "time_epoch") int? timeEpoch,
    required String time,
    @JsonKey(name: "temp_c") double? tempC,
    @JsonKey(name: "temp_f") double? tempF,
    @JsonKey(name: "is_day") int? isDay,
    required Condition condition,
    @JsonKey(name: "wind_kph") double? windKph,
    @JsonKey(name: "wind_dir") String? windDir,
    @JsonKey(name: "pressure_mb") double? pressureMb,
    @JsonKey(name: "precip_mm") double? precipMm,
    @JsonKey(name: "humidity") int? humidity,
    @JsonKey(name: "cloud") int? cloud,
    @JsonKey(name: "feelslike_c") double? feelsLikeC,
    @JsonKey(name: "windchill_c") double? windChillC,
    @JsonKey(name: "heatindex_c") double? heatIndexC,
    @JsonKey(name: "dewpoint_c") double? dewPointC,
    @JsonKey(name: "will_it_rain") int? willItRain,
    @JsonKey(name: "chance_of_rain") int? chanceOfRain,
    
    double? uv,
  }) = _Hour;

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);
}