// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return WeatherData(
    mainPointers: json['mainPointers'] == null
        ? null
        : Main.fromJson(json['mainPointers'] as Map<String, dynamic>),
    windMod: json['windMod'],
    visibility: json['visibility'] as num?,
    clouds: json['clouds'],
    dateTime: json['dateTime'] as String?,
  );
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'mainPointers': instance.mainPointers,
      'windMod': instance.windMod,
      'visibility': instance.visibility,
      'clouds': instance.clouds,
      'dateTime': instance.dateTime,
    };
