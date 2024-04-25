// Создайте отдельный виджет для загрузки и отображения изображения
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String? icon;

  const WeatherIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://openweathermap.org/img/wn/${icon}@2x.png',
    );
  }
}
