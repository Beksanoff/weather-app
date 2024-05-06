import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/ui/theme/theme.dart';

class CityNameWidget extends StatelessWidget {
  final String? cityName;

  const CityNameWidget({super.key, this.cityName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 216, top: 20),
            child: Text(state.weatherModel.cityName,
                style: themeData.textTheme.bodyLarge),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
