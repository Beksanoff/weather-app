import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/features/home/widgets/city_widget/weather_descriptions.dart';
import 'package:weather_app/features/home/widgets/widgets.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import '../widgets/city_widget/temp_widget.dart';
import '../widgets/city_widget/weather_icon.dart';

class HomeScreenInfo extends StatelessWidget {
  const HomeScreenInfo({super.key, required WeatherModel? weatherModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CustomContainer(
                  height: 220,
                  child: Column(
                    children: [
                      CityNameWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 25),
                                child: TemperatureWidget(),
                              ),
                              WeatherDescription(),
                            ],
                          ),
                          WeatherIcon(),
                        ],
                      ),
                    ],
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

        return const CircularProgressIndicator();
      },
    );
  }
}
