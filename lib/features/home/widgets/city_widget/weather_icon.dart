// Создайте отдельный виджет для загрузки и отображения изображения
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';

class WeatherIcon extends StatelessWidget {
  final String? icon;

  const WeatherIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Image.network(
            'https://openweathermap.org/img/wn/${icon}@2x.png',
          );
        }
        return const Text('Error loading image');
      },
    );
  }
}
