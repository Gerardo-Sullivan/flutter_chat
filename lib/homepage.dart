import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_chat/models/directline.dart';
import 'package:flutter_chat/models/conversation.dart';
import 'package:flutter_chat/chatscreen.dart';
import 'dart:convert';

class Homepage extends StatelessWidget {
  final String botSecret = "";

  Future<DirectLine> fetchToken() async {
    var headers = {"Authorization": "Bearer " + botSecret};

    final response = await http.post(
        "https://directline.botframework.com/v3/directline/tokens/generate",
        headers: headers);

    if (response.statusCode == 200) {
      return DirectLine.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load DirectLine post');
    }
  }

  Future<Conversation> startConversation(String token) async {
    var headers = {"Authorization": "Bearer " + token};

    final response = await http.post(
        "https://directline.botframework.com/v3/directline/conversations",
        headers: headers);

    if (response.statusCode == 200) {
      return Conversation.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load DirectLine post');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Chat"),
        ),
        body: new FutureBuilder<DirectLine>(
            future: fetchToken(),
            builder: (context, directLine) {
              if (directLine.hasData) {
                new FutureBuilder(
                  future: startConversation(directLine.data.token),
                  builder: (context, conversation) {
                    if (conversation.hasData) {}
                  },
                );
              } else if (directLine.hasError) {
                return Text("${directLine.error}");
              }

              return CircularProgressIndicator();
            }));
  }
}
