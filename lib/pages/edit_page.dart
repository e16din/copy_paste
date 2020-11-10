import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final String data;

  EditPage({Key key, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Copy & Paste")),
        body: Center(
            child: Column(children: [
          Text(
            'Second Page: $data',
            style: TextStyle(fontSize: 50),
          ),
          RaisedButton(child: Text(''), onPressed: () {})
        ])));
  }
}
