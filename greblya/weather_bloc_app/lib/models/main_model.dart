class MainPointers {
  final double temp;
  final int pressure;
  final int humidity;

  MainPointers(
      {required this.temp, required this.pressure, required this.humidity});

  factory MainPointers.fromJson(Map<String, dynamic> json) {
    return MainPointers(
        temp: json["temp"],
        pressure: json["pressure"],
        humidity: json["humidity"]);
  }
}
