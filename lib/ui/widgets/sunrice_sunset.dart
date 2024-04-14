// time_utils.dart

String formatSunsetTime(int sunsetTimestamp) {
  DateTime sunset = DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);
  return '${sunset.hour}:${sunset.minute}';
}

String formatSunriseTime(int sunriseTimestamp) {
  DateTime sunrise =
      DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
  return '${sunrise.hour}:${sunrise.minute.toString().padLeft(2, '0')}';
}
