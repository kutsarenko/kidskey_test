// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return WeatherData(
    mainPointers: json['main'] == null
        ? null
        : Main.fromJson(json['main'] as Map<String, dynamic>),
    description: (json['weather'] as List<dynamic>?)
        ?.map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    wind: json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    visibility: json['visibility'] as num?,
    clouds: json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    dateTime: json['dt_txt'] as String?,
  );
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'main': instance.mainPointers,
      'weather': instance.description,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'clouds': instance.clouds,
      'dt_txt': instance.dateTime,
    };
