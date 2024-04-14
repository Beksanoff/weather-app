import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme/theme.dart';

class TemperatureWidget extends StatelessWidget {
  final int? temperature;

  const TemperatureWidget({this.temperature});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${temperature?.round() ?? ''}°',
      style: themeData.textTheme.displayLarge,
    );
  }
}
