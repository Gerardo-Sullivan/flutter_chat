class BotConversation {
  final String conversationId;
  final String token;
  final int expiresIn;
  final String streamUrl;

  BotConversation(
      {this.conversationId, this.token, this.expiresIn, this.streamUrl});

  factory BotConversation.fromJson(Map<String, dynamic> json) {
    return BotConversation(
        conversationId: json['conversationId'],
        token: json['token'],
        expiresIn: json['expires_in'],
        streamUrl: json['streamUrl']);
  }
}
