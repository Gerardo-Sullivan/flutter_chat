// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelAccount _$ChannelAccountFromJson(Map<String, dynamic> json) {
  return ChannelAccount(
      json['id'] as String, json['name'] as String, json['role'] as String);
}

Map<String, dynamic> _$ChannelAccountToJson(ChannelAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role
    };
