import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/ui/theme/theme.dart';

class TemperatureWidget extends StatelessWidget {
  final int? temperature;

  const TemperatureWidget({super.key, this.temperature});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Text(
            '${state.weatherModel.currentWeather.temperature.round()}°',
            style: themeData.textTheme.displayLarge,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
