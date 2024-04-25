import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/home/widgets/widgets.dart';
import '../../../ui/theme/theme.dart';
import 'city_widget/weather_icon.dart';

class WeatherCard extends StatelessWidget {
  final _weatherModel;

  const WeatherCard(this._weatherModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/screen2');
      },
      child: CustomContainer(
        height: 300,
        child: Column(
          children: [
            for (int i = 0; i < 3; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    i == 0
                        ? 'Сегодня'
                        : i == 1
                            ? 'Завтра'
                            : toBeginningOfSentenceCase(
                                DateFormat('EEEE', 'ru_RU').format(
                                  DateTime.now().add(
                                    Duration(days: i),
                                  ),
                                ),
                              ),
                    style: themeData.textTheme.bodyLarge,
                  ),
                  WeatherIcon(icon: _weatherModel.forecast[i].icon),
                  Text(
                    '${_weatherModel.forecast[i].temperature.toInt()}°',
                    style: themeData.textTheme.bodyLarge,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
