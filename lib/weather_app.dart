import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/features/weekly_forecast/view/weekly_screen.dart';
import 'package:weather_app/repositories/weather_app/interface_weather_repository.dart';
import 'features/home/home.dart';
import 'ui/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(GetIt.I<InterfaceWeatherRepository>()),
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const WeatherScreen(),
          '/screen2': (context) => const WeatherSecondScreen(),
        },
      ),
    );
  }
}
