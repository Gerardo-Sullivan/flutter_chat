import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_chat/models/from.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity {
  String type;
  From from;
  String text;

  Activity(this.type, this.from, this.text);

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
