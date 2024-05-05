part of 'home_screen_bloc.dart';

class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final WeatherModel weatherModel;

  HomeScreenLoaded({required this.weatherModel});
}
