// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(json['contentType'] as String, json['contentUrl'] as String,
      json['content'], json['name'] as String, json['thumbnailUrl'] as String);
}

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'contentType': instance.contentType,
      'contentUrl': instance.contentUrl,
      'content': instance.content,
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl
    };
