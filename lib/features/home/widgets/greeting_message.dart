String greetingMessage() {
  var hour = DateTime.now().hour;
  if (hour < 6) {
    return 'Доброй ночи!';
  }
  if (hour < 12) {
    return 'Доброе утро!';
  }
  if (hour < 17) {
    return 'Добрый день!';
  }
  if (hour < 21) {
    return 'Добрый вечер!';
  }
  return 'Доброй ночи!';
}
