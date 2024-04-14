import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/ui/theme/theme.dart';

class WeatherRow extends StatelessWidget {
  final String iconPath;
  final String? value;
  final String unit;

  const WeatherRow({
    required this.iconPath,
    this.value,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 7),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value ?? '',
                style: themeData.textTheme.bodyMedium,
              ),
              TextSpan(
                text: unit,
                style: themeData.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
