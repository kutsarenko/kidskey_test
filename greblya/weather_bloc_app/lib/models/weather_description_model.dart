class WeatherDescription {
  final String mainDescription;

  WeatherDescription({required this.mainDescription});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    // var list = json['description'] as List;

    // print('descList - ${descList.length}');
    return WeatherDescription(mainDescription: json["main"]);
  }
}
