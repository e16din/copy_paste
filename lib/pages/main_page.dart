import 'package:copy_paste/data.dart';
import 'package:copy_paste/pages/side_menu_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Copy & Paste"),
          actions: [
            Padding(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SettingsPage');
                    },
                    child: Icon(Icons.settings)))
          ],
        ),
        drawer: SideMenuPage(
            onGroupItemClicked: (context, group) => onGroupItemClicked(context, group)),
        body: Stack(children: [
          ListView.separated(
              itemBuilder: (context, index) => Text('$index'),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.green,
                    indent: 12,
                    endIndent: 12,
                    thickness: 0.8,
                    height: 0.8,
                  ),
              itemCount: 5),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.all(36),
                  child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pushNamed(context, '/EditPage');
                      })))
        ]));
  }

  void onGroupItemClicked(BuildContext context, Group group) {
    print(group.title);
    Scaffold.of(context).openEndDrawer();
  }
}
