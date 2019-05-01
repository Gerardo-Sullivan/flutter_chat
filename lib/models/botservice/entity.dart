import 'package:json_annotation/json_annotation.dart';
part 'entity.g.dart';

@JsonSerializable()
class Entity {
  String type;

  Entity(this.type);

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  Map<String, dynamic> toJson() => _$EntityToJson(this);
}
