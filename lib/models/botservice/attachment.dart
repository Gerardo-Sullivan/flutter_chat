import 'package:json_annotation/json_annotation.dart';
part 'attachment.g.dart';

@JsonSerializable()
class Attachment {
  String contentType;
  String contentUrl;
  Object content;
  String name;
  String thumbnailUrl;

  Attachment(this.contentType, this.contentUrl, this.content, this.name,
      this.thumbnailUrl);

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
