part of 'home_screen_bloc.dart';

class HomeScreenEvent {}

class HomeGetWeatherEvent extends HomeScreenEvent {
  final dynamic cityName;

  HomeGetWeatherEvent({required this.cityName});
}
