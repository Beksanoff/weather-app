import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/repositories/weather_app/interface_weather_repository.dart';

part 'home_screen_state.dart';
part 'home_screen_event.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this.getWeatherRepository) : super(HomeScreenInitial()) {
    on<HomeGetWeatherEvent>((event, emit) async {
      final getCity = await getWeatherRepository.getWeather(event.cityName);
      emit(HomeScreenLoaded(weatherModel: getCity));
    });
  }
  final InterfaceWeatherRepository getWeatherRepository;
}
