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

  ChatScreen({Key key, @required this.streamUrl, @required this.token})
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
        widget.streamUrl.replaceAll("https", "wws"),
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

  Future<int> sendMessage(String message) async {
    var headers = {
      "Authorization": "Bearer " + widget.token,
      "Content-Type": "application/json"
    };
    var body = jsonEncode(new Activity("message", new From("user"), message));

    final response =
        await http.post(widget.streamUrl, headers: headers, body: body);

    if (response.statusCode == 200) {
      return int.parse(json.decode(response.body)["id"]);
    } else {
      print('Failed to load DirectLine post');
      return null;
    }
  }

  void _handleSubmit(String text) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(Sender.Client, text: text);
    sendMessage(message.text);

    setState(() {
      _messages.insert(0, message);
    });
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
