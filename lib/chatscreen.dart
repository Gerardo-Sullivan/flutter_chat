import 'package:flutter/material.dart';
import 'package:flutter_chat/chatmessage.dart';
import 'package:flutter_chat/models/activity.dart';
import 'package:flutter_chat/models/from.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  final String streamUrl;
  final String token;
  final String conversationId;

  ChatScreen(
      {Key key,
      @required this.streamUrl,
      @required this.token,
      @required this.conversationId})
      : super(key: key);

  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  WebSocketChannel channel;
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect(
        widget.streamUrl, //.replaceAll("https", "wws"),
        headers: {"Upgrade": "websocket", "Connection": "upgrade"});
    channel.stream.listen((data) => setState(() {
          print("ReceivedData: " + data);
          //_messages.insert(0, new ChatMessage(Sender.Bot, text: data));
        }));
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  Future<bool> sendMessage(String message) async {
    var url =
        "https://directline.botframework.com/v3/directline/conversations/${widget.conversationId}/activities";
    var headers = {
      "Authorization": "Bearer " + widget.token,
      "Content-Type": "application/json"
    };
    var body = jsonEncode(new Activity("message", new From("user1"), message));

    print("url: " + url);
    print("token: " + widget.token);
    print("jsonBody: " + body);

    final response = await http.post(url, headers: headers, body: body);

    print("message sent");

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print('Failed to Send message post');
      print(response.statusCode);
      return false;
    }
  }

  void _handleSubmit(String text) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(Sender.Client, text: text);
    setState(() {
      _messages.insert(0, message);
    });
    sendMessage(message.text).then((id) {});
  }

  Widget _chatEnvironment() {
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                    new InputDecoration.collapsed(hintText: "Start typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(_chatController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _chatEnvironment(),
        )
      ],
    );
  }
}
