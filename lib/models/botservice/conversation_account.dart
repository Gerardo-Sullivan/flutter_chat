import 'package:json_annotation/json_annotation.dart';
part 'conversation_account.g.dart';

@JsonSerializable()
class ConversationAccount {
  String id;
  bool isGroup;
  String name;
  String conversationType;

  ConversationAccount(this.id, this.isGroup, this.name, this.conversationType);

  factory ConversationAccount.fromJson(Map<String, dynamic> json) =>
      _$ConversationAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationAccountToJson(this);
}
