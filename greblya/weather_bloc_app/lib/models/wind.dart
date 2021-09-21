class WindModel {
  int speed;

  WindModel({required this.speed});

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(speed: json['speed']);
  }
}
