import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final String data;

  SettingsPage({Key key, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("SettingsPage")),
        body: Center(
            child: Column(children: [
          Text(
            'SettingsPage: $data',
            style: TextStyle(fontSize: 50),
          ),
          RaisedButton(child: Text('Click'), onPressed: () {})
        ])));
  }
}
