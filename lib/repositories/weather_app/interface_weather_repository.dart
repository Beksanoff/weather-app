import 'package:weather_app/repositories/models/weather_model.dart';

abstract interface class InterfaceWeatherRepository {
  Future<WeatherModel> getWeather(String cityName);
  Future<String> getCurrentCity();
}
