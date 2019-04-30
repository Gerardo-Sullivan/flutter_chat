class DirectLine {
  final String conversationId;
  final String token;
  final int expiresIn;

  DirectLine({this.conversationId, this.token, this.expiresIn});

  factory DirectLine.fromJson(Map<String, dynamic> json) {
    return DirectLine(
      conversationId: json['conversationId'],
      token: json['token'],
      expiresIn: json['expires_in'],
    );
  }
}
