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
          if (icon != null) {
            return Image.network(
              'https://openweathermap.org/img/wn/${icon}@2x.png',
            );
          } else {
            return const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text('Icon break :) \n We fix it!'),
            );
          }
        }

        return const Text('Error loading image');
      },
    );
  }
}
