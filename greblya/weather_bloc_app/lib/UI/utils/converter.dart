class ConvertWeather {
  static String convertTimeToString(String date) {
    List<String> newDate = date.split(' ');
    String finalTime = newDate[1].substring(0, 5);
    return finalTime;
  }

  static num convertToCelcium(num temp) {
    num celciumTemp = temp - 273.15;
    return celciumTemp;
  }
}
