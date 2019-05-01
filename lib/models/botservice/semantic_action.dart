import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_chat/models/botservice/entity.dart';
part 'semantic_action.g.dart';

@JsonSerializable()
class SemanticAction {
  String id;
  Entity entity;

  SemanticAction(this.id, this.entity);

  factory SemanticAction.fromJson(Map<String, dynamic> json) =>
      _$SemanticActionFromJson(json);

  Map<String, dynamic> toJson() => _$SemanticActionToJson(this);
}
