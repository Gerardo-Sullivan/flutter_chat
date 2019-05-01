import 'package:json_annotation/json_annotation.dart';
part 'card_action.g.dart';

@JsonSerializable()
class CardAction {
  String image;
  String text;
  String title;
  String type;
  Object value;

  CardAction(this.image, this.text, this.title, this.type, this.value);

  factory CardAction.fromJson(Map<String, dynamic> json) =>
      _$CardActionFromJson(json);

  Map<String, dynamic> toJson() => _$CardActionToJson(this);
}
