import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/repositories/weather_app/interface_weather_repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final InterfaceWeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetch>((event, emit) async {
      try {
        if (state is! WeatherLoaded) {
          emit(WeatherLoading());
        }
        String cityName = await weatherRepository.getCurrentCity();
        final weatherModel = await weatherRepository.getWeather(cityName);
        emit(WeatherLoaded(weatherModel: weatherModel));
      } catch (e) {
        emit(WeatherError(exeption: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
