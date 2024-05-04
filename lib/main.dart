import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/repositories/weather_app/interface_weather_repository.dart';
import 'package:weather_app/weather_app.dart';

import 'repositories/weather_app/weather_app_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<InterfaceWeatherRepository>(
    () => WeatherService(),
  );
  initializeDateFormatting('ru_RU', null).then(
    (_) {
      runApp(const MyApp());
    },
  );
}
