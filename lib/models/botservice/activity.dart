import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_chat/models/botservice/channel_account.dart';
import 'package:flutter_chat/models/botservice/attachment.dart';
import 'package:flutter_chat/models/botservice/conversation_account.dart';
import 'package:flutter_chat/models/botservice/conversation_reference.dart';
import 'package:flutter_chat/models/botservice/suggested_actions.dart';
import 'package:flutter_chat/models/botservice/semantic_action.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity {
  String action;
  List<Attachment> attachments;
  String attachmentLayout;
  Object channelData;
  String channelId;
  ConversationAccount conversation;
  String code;
  List<Object> entities;
  ChannelAccount from;
  bool historyDisclosed;
  String id;
  String inputHint;
  String local;
  DateTime localTimestamp;
  List<ChannelAccount> membersAdded;
  List<ChannelAccount> membersRemoved;
  String name;
  ChannelAccount recipient;
  ConversationReference relatesTo;
  String replyTo;
  String serviceUrl;
  String speak;
  SuggestedActions suggestedActions;
  String summary;
  String text;
  String textFormat;
  DateTime timeStamp;
  String topicName;
  String type;
  Object value;
  SemanticAction semanticAction;

  Activity(
      this.action,
      this.attachments,
      this.attachmentLayout,
      this.channelData,
      this.channelId,
      this.conversation,
      this.code,
      this.entities,
      this.from,
      this.historyDisclosed,
      this.id,
      this.inputHint,
      this.local,
      this.localTimestamp,
      this.membersAdded,
      this.membersRemoved,
      this.name,
      this.recipient,
      this.relatesTo,
      this.replyTo,
      this.serviceUrl,
      this.speak,
      this.suggestedActions,
      this.summary,
      this.semanticAction,
      this.text,
      this.textFormat,
      this.timeStamp,
      this.topicName,
      this.type,
      this.value);

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
