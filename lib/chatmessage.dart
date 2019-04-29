import 'package:flutter/material.dart';

enum Sender { Bot, Client }

class ChatMessage extends StatelessWidget {
  final String text;
  final Sender sender;

// constructor to get text from textfield
  ChatMessage(this.sender, {this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.bottomRight,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: sender == Sender.Bot
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Text(
                text,
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            new Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: new CircleAvatar(
                  child: new Image.network(
                      "http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
                )),
          ],
        ));
  }
}
