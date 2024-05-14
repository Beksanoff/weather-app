import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/features/home/widgets/widgets.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/ui/ui.dart';
import '../widgets/city_widget/temp_widget.dart';
import '../widgets/city_widget/weather_descriptions.dart';
import '../widgets/city_widget/weather_icon.dart';

class HomeScreenInfo extends StatelessWidget {
  const HomeScreenInfo({super.key, required WeatherModel weatherModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomContainer(
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Column(
                      children: [
                        const CityNameWidget(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                TemperatureWidget(),
                                WeatherDescription(),
                              ],
                            ),
                            WeatherIcon(
                                icon: state.weatherModel.currentWeather.icon),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const SizedBox(height: 20),
                  SecondInfoContainer(state.weatherModel),
                  const SizedBox(height: 20),
                  WeatherCard(state.weatherModel),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          );
        }

        return const LoadingIndicator();
      },
    );
  }
}
