import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/api/models/weather.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET('/tasks')
  Future<List<WeatherModel>> getWeather(
    @Query('q') String cityName,
    @Query('cnt') int count,
    @Query('appid') String appId,
    @Query('units') String units,
    @Query('lang') String lang,
  );
}
