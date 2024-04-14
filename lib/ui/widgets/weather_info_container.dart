import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/theme/theme.dart';

class WeatherInfoContainer extends StatelessWidget {
  final String text;
  final String? iconPath;

  WeatherInfoContainer({
    required this.text,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 155,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),

        //height 140
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, bottom: 60),
                child: Text(
                  text,
                  style: themeData.textTheme.displaySmall,
                ),
              ),
            ),
            if (iconPath != null)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, top: 60, left: 5),
                  child: SvgPicture.asset(
                    iconPath!,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
