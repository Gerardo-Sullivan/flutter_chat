import 'package:json_annotation/json_annotation.dart';
part 'from.g.dart';

@JsonSerializable()
class From {
  String id;

  From(this.id);

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}
