import 'package:flutter_chat/models/botservice/channel_account.dart';
import 'package:flutter_chat/models/botservice/conversation_account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation_reference.g.dart';

@JsonSerializable()
class ConversationReference {
  String activityId;
  ChannelAccount bot;
  String channelId;
  ConversationAccount conversation;
  String serviceUrl;
  ChannelAccount user;

  ConversationReference(this.activityId, this.bot, this.channelId,
      this.conversation, this.serviceUrl, this.user);

  factory ConversationReference.fromJson(Map<String, dynamic> json) =>
      _$ConversationReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationReferenceToJson(this);
}
