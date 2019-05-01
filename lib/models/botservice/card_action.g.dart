// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardAction _$CardActionFromJson(Map<String, dynamic> json) {
  return CardAction(json['image'] as String, json['text'] as String,
      json['title'] as String, json['type'] as String, json['value']);
}

Map<String, dynamic> _$CardActionToJson(CardAction instance) =>
    <String, dynamic>{
      'image': instance.image,
      'text': instance.text,
      'title': instance.title,
      'type': instance.type,
      'value': instance.value
    };
