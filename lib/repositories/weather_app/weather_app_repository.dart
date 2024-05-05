import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/repositories/weather_app/interface_weather_repository.dart';

class WeatherService implements InterfaceWeatherRepository {
  @override
  Future<WeatherModel> getWeather(String cityName) async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&cnt=7&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric&lang=ru');

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String cityName = placemarks[0].locality;

    return cityName;
  }
}
