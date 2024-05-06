part of 'home_screen_bloc.dart';

class WeatherEvent {}

class WeatherFetch extends WeatherEvent {
  final String cityName;

  WeatherFetch({required this.cityName});
}
