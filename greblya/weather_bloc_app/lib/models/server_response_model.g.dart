// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) {
  return ServerResponse(
    list: (json['list'] as List<dynamic>?)
        ?.map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
        .toList(),
    city: json['city'] == null
        ? null
        : City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServerResponseToJson(ServerResponse instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };
