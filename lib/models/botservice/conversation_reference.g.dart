// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationReference _$ConversationReferenceFromJson(
    Map<String, dynamic> json) {
  return ConversationReference(
      json['activityId'] as String,
      json['bot'] == null
          ? null
          : ChannelAccount.fromJson(json['bot'] as Map<String, dynamic>),
      json['channelId'] as String,
      json['conversation'] == null
          ? null
          : ConversationAccount.fromJson(
              json['conversation'] as Map<String, dynamic>),
      json['serviceUrl'] as String,
      json['user'] == null
          ? null
          : ChannelAccount.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ConversationReferenceToJson(
        ConversationReference instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'bot': instance.bot,
      'channelId': instance.channelId,
      'conversation': instance.conversation,
      'serviceUrl': instance.serviceUrl,
      'user': instance.user
    };
