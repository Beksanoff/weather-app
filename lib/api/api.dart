import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/api/models/weather.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;

  @GET('/forecast/daily')
  Future<List<WeatherModel>> getWeather(
    @Query('q') String cityName,
    @Query('cnt') int count,
    @Query('appid') String appId,
    @Query('units') String units,
    @Query('lang') String lang,
  );
}

WeatherApiClient initApiClient() {
  final apiUrl = dotenv.env['API_URL'];
  final dio = Dio();
  if (apiUrl != null) {
    return WeatherApiClient(dio, baseUrl: apiUrl);
  }
  return WeatherApiClient(dio);
}
