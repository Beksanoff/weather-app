import 'package:flutter/material.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/ui/widgets/weather_info_container.dart';

class WeatherTile extends StatelessWidget {
  final WeatherDay day;
  final String weekDay;
  final WeatherModel weatherModel;
  WeatherTile({
    required this.day,
    required this.weekDay,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.network(
        'https://openweathermap.org/img/wn/${day.icon}.png',
      ),
      tilePadding: const EdgeInsets.all(0),
      title: Center(
        child: Text(
          weekDay,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.orangeAccent[300],
      childrenPadding: const EdgeInsets.all(10),
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WeatherInfoContainer(
                  text: 'Ветер\n${day.windSpeed} м/с',
                ),
                const SizedBox(width: 10),
                WeatherInfoContainer(text: 'soon'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WeatherInfoContainer(
                  text: 'Влажность\n ${day.humidity}%',
                ),
                const SizedBox(width: 10),
                WeatherInfoContainer(
                  text: 'Вероятность\nосадков\n${day.pop}%',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
