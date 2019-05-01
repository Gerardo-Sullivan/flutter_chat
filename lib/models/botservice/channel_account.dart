import 'package:json_annotation/json_annotation.dart';
part 'channel_account.g.dart';

@JsonSerializable()
class ChannelAccount {
  String id;
  String name;
  String role;

  ChannelAccount(this.id, this.name, this.role);

  factory ChannelAccount.fromJson(Map<String, dynamic> json) =>
      _$ChannelAccountFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelAccountToJson(this);
}
