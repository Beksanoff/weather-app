class WeatherDay {
  final double temperature;
  final String weatherDescription;
  final int humidity;
  final int windSpeed;
  final int pop;
  final String icon;
  final double speed;
  final int sunset;
  final int sunrise;
  final double tempMax;
  final double tempMin;

  WeatherDay({
    required this.temperature,
    required this.weatherDescription,
    required this.humidity,
    required this.windSpeed,
    required this.pop,
    required this.icon,
    required this.speed,
    required this.sunset,
    required this.sunrise,
    required this.tempMax,
    required this.tempMin,
  });

  factory WeatherDay.fromJson(Map<String, dynamic> json) {
    return WeatherDay(
      temperature:
          json['temp']['day'] != null ? json['temp']['day'].toDouble() : 0.0,
      weatherDescription: json['weather'][0]['description'] ?? '',
      humidity: json['humidity'] ?? 0,
      windSpeed: json['speed'] != null ? json['speed'].toInt() : 0,
      pop: json['pop'] != null ? json['pop'].toInt() : 0,
      icon: json['weather'][0]['icon'] ?? '',
      speed: json['speed'] != null ? json['speed'].toDouble() : 0.0,
      sunset: json['sunset'] ?? 0,
      sunrise: json['sunrise'] ?? 0,
      tempMax:
          json['temp']['max'] != null ? json['temp']['max'].toDouble() : 0.0,
      tempMin:
          json['temp']['min'] != null ? json['temp']['min'].toDouble() : 0.0,
    );
  }
}

class WeatherModel {
  final String cityName;
  final WeatherDay currentWeather;
  final List<WeatherDay> forecast;

  WeatherModel({
    required this.cityName,
    required this.forecast,
    required this.currentWeather,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<WeatherDay> forecastList =
        list.map((i) => WeatherDay.fromJson(i)).toList();

    return WeatherModel(
      cityName: json['city']['name'] ?? '',
      currentWeather: WeatherDay.fromJson(json['list'][0]),
      forecast: forecastList,
    );
  }
}
