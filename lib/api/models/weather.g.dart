// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      cityName: json['cityName'] as String,
      forecast: (json['forecast'] as List<dynamic>)
          .map((e) => WeatherDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentWeather:
          WeatherDay.fromJson(json['currentWeather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'currentWeather': instance.currentWeather,
      'forecast': instance.forecast,
    };

WeatherDay _$WeatherDayFromJson(Map<String, dynamic> json) => WeatherDay(
      temperature: (json['temperature'] as num).toDouble(),
      weatherDescription: json['weatherDescription'] as String,
      humidity: json['humidity'] as int,
      windSpeed: json['windSpeed'] as int,
      pop: json['pop'] as int,
      icon: json['icon'] as String,
      speed: (json['speed'] as num).toDouble(),
      sunset: json['sunset'] as int,
      sunrise: json['sunrise'] as int,
      tempMax: (json['tempMax'] as num).toDouble(),
      tempMin: (json['tempMin'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDayToJson(WeatherDay instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'weatherDescription': instance.weatherDescription,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'pop': instance.pop,
      'icon': instance.icon,
      'speed': instance.speed,
      'sunset': instance.sunset,
      'sunrise': instance.sunrise,
      'tempMax': instance.tempMax,
      'tempMin': instance.tempMin,
    };
