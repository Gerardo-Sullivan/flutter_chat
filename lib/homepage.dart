import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_chat/models/bot_conversation.dart';
import 'package:flutter_chat/chatscreen.dart';
import 'dart:convert';

class Homepage extends StatelessWidget {
  final String botSecret = "";

  Future<BotConversation> startConversation() async {
    var headers = {"Authorization": "Bearer " + botSecret};

    final response = await http.post(
        "https://directline.botframework.com/v3/directline/conversations",
        headers: headers);

    if (response.statusCode == 200) {
      return BotConversation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Conversation post');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Chat"),
        ),
        body: new FutureBuilder<BotConversation>(
            future: startConversation(),
            builder: (context, conversation) {
              if (conversation.hasData) {
                return new ChatScreen(
                    streamUrl: conversation.data.streamUrl,
                    token: conversation.data.token);
              } else if (conversation.hasError) {
                return Text("${conversation.error}");
              }

              return CircularProgressIndicator();
            }));
  }
}
