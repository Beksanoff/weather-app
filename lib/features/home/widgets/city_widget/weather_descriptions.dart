import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Text(
            state.weatherModel.currentWeather.weatherDescription,
          );
        }
        return Container();
      },
    );
  }
}
