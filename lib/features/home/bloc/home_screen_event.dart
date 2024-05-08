part of 'home_screen_bloc.dart';

class WeatherEvent {}

class WeatherFetch extends WeatherEvent {
  final Completer? completer;
  final String cityName;

  WeatherFetch({required this.cityName, required this.completer});
}
