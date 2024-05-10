import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/ui/theme/theme.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              state.weatherModel.currentWeather.weatherDescription,
              style: themeData.textTheme.bodyLarge,
            ),
          );
        }
        return Container();
      },
    );
  }
}
