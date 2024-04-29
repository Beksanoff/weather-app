import 'package:flutter/material.dart';
import 'package:weather_app/features/weekly_forecast/view/weekly_screen.dart';
import 'features/home/home.dart';
import 'ui/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const WeatherScreen(),
        '/screen2': (context) => const WeatherSecondScreen(),
      },
    );
  }
}
