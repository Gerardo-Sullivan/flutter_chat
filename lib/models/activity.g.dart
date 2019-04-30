// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
      json['type'] as String,
      json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>),
      json['text'] as String);
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'type': instance.type,
      'from': instance.from,
      'text': instance.text
    };
