import 'package:flutter/material.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/features/home/widgets/show_widget/show_weather.dart';
import 'package:weather_app/features/home/widgets/show_widget/weather_info_row.dart';

class SecondInfoContainer extends StatelessWidget {
  final WeatherModel _weatherModel;

  const SecondInfoContainer(this._weatherModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showWeather(context, _weatherModel),
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue[300],
        ),
        // height 100
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            WeatherRow(
              iconPath: 'assets/icons/pop.svg',
              value: '${_weatherModel.currentWeather.pop}%',
            ),
            WeatherRow(
              iconPath: 'assets/icons/humidity_group.svg',
              value: '${_weatherModel.currentWeather.humidity}%',
            ),
            WeatherRow(
              iconPath: 'assets/icons/wind_group.svg',
              value: '${_weatherModel.currentWeather.windSpeed}',
              unit: ' км/ч',
            ),
            const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
