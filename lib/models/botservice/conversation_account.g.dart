// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationAccount _$ConversationAccountFromJson(Map<String, dynamic> json) {
  return ConversationAccount(json['id'] as String, json['isGroup'] as bool,
      json['name'] as String, json['conversationType'] as String);
}

Map<String, dynamic> _$ConversationAccountToJson(
        ConversationAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isGroup': instance.isGroup,
      'name': instance.name,
      'conversationType': instance.conversationType
    };
