import 'package:flutter/material.dart';
import 'package:weather_app/features/home/widgets/widgets.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/ui/theme/theme.dart';
import 'package:weather_app/features/home/widgets/city_widget/temp_widget.dart';
import '../widgets/city_widget/weather_icon.dart';

class HomeScreenInfo extends StatelessWidget {
  const HomeScreenInfo({
    Key? key,
    required WeatherModel? weatherModel,
  }) : _weatherModel = weatherModel;

  final WeatherModel? _weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomContainer(
            height: 220,
            child: Column(
              children: [
                CityNameWidget(cityName: _weatherModel?.cityName),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TemperatureWidget(
                            temperature: _weatherModel!
                                .currentWeather.temperature
                                .toInt(),
                          ),
                        ),
                        Text(
                          capitalize(
                              _weatherModel.currentWeather.weatherDescription),
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    WeatherIcon(
                      icon: _weatherModel.currentWeather.icon,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            /* const DateFirstScreen(), */
            const SizedBox(height: 20),
            SecondInfoContainer(_weatherModel),
            const SizedBox(height: 20),
            WeatherCard(_weatherModel),
            const SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
