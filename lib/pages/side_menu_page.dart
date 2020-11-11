import 'package:flutter/material.dart';

import '../data.dart';

class SideMenuPage extends StatelessWidget {
  final groups = [
    Group(title: 'Header'),
    Group(title: '[ Стартовая группа ]'),
  ];

  final Function(BuildContext, Group) onGroupItemClicked;

  SideMenuPage({Key key, this.onGroupItemClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        separatorBuilder: (context, index) =>
        index == 0
            ? Container()
            : Divider(
          color: Colors.green,
          indent: 12,
          endIndent: 12,
          thickness: 0.5,
          height: 0.5,
        ),
        itemCount: groups.length,
        itemBuilder: (context, index) =>
            Padding(
                padding: EdgeInsets.all(0),
                child: index == 0
                    ? DrawerHeader(
                  child: Stack(children: [
                    Text(
                      'Группы',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.white10,
                          child: Text('Добавить группу'),
                          onPressed: () {}),
                    )
                  ]),
                  decoration: BoxDecoration(color: Colors.green),
                )
                    : buildGroupItem(context, groups[index])),
      ),
    );
  }

  ListTile buildGroupItem(BuildContext context, Group group) {
    return ListTile(
      title: Text(
        group.title,
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
      ),
      onTap: () {
        onGroupItemClicked(context, group);
      },
    );
  }
}
