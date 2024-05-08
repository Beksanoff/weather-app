part of 'home_screen_bloc.dart';

class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherState {
  final Object? exeption;

  WeatherError({required this.exeption});
}
