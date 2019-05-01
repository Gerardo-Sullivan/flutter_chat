// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semantic_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemanticAction _$SemanticActionFromJson(Map<String, dynamic> json) {
  return SemanticAction(
      json['id'] as String,
      json['entity'] == null
          ? null
          : Entity.fromJson(json['entity'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SemanticActionToJson(SemanticAction instance) =>
    <String, dynamic>{'id': instance.id, 'entity': instance.entity};
