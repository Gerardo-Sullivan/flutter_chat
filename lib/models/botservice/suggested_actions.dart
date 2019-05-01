import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_chat/models/botservice/card_action.dart';
part 'suggested_actions.g.dart';

@JsonSerializable()
class SuggestedActions {
  CardAction actions;
  List<String> to;

  SuggestedActions(this.actions, this.to);

  factory SuggestedActions.fromJson(Map<String, dynamic> json) =>
      _$SuggestedActionsFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestedActionsToJson(this);
}
