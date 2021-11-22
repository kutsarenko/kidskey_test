// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) {
  return WeatherDescription(
    main: json['main'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };
