import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme/theme.dart';

class CityNameWidget extends StatelessWidget {
  final String? cityName;

  const CityNameWidget({this.cityName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 216, top: 20),
      child: Text(cityName ?? '', style: themeData.textTheme.bodyLarge),
    );
  }
}
