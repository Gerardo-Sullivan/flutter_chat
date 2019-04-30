class Conversation {
  final String conversationId;
  final String token;
  final int expiresIn;
  final String streamUrl;

  Conversation({this.conversationId, this.token, this.expiresIn, this.streamUrl});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      conversationId: json['conversationId'],
      token: json['token'],
      expiresIn: json['expires_in'],
      streamUrl: json['streamUrl']
    );
  }
}
