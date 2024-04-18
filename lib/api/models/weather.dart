import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel {
  final String cityName;
  final WeatherDay currentWeather;
  final List<WeatherDay> forecast;

  WeatherModel({
    required this.cityName,
    required this.forecast,
    required this.currentWeather,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class WeatherDay {
  final double temperature;
  final String weatherDescription;
  final int humidity;
  final int windSpeed;
  final int pop;
  final String icon;
  final double speed;
  final int sunset;
  final int sunrise;
  final double tempMax;
  final double tempMin;

  WeatherDay({
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.windSpeed,
    required this.pop,
    required this.icon,
    required this.speed,
    required this.sunset,
    required this.sunrise,
    required this.tempMax,
    required this.tempMin,
  });

  factory WeatherDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDayToJson(this);
}
