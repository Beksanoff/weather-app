import 'package:flutter/material.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/ui/widgets/sunrice_sunset.dart';
import 'package:weather_app/ui/widgets/weather_info_container.dart';

void showWeather(BuildContext context, WeatherModel weatherModel) {
  String sunsetTime = formatSunsetTime(weatherModel.currentWeather.sunset);
  String sunriseTime = formatSunriseTime(weatherModel.currentWeather.sunrise);
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    WeatherInfoContainer(
                      text: 'Закат\n$sunsetTime',
                      iconPath: 'assets/icons/sunset.svg',
                    ),
                    const SizedBox(width: 10),
                    WeatherInfoContainer(
                      text: 'Восход\n$sunriseTime',
                      iconPath: 'assets/icons/sunrise.svg',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    WeatherInfoContainer(
                      text:
                          'Влажность\n${weatherModel.currentWeather.humidity}%',
                      iconPath: 'assets/icons/humidity.svg',
                    ),
                    const SizedBox(width: 10),
                    WeatherInfoContainer(
                      text:
                          'Скорость ветра\n${weatherModel.currentWeather.windSpeed}км/ч',
                      iconPath: 'assets/icons/wind.svg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
