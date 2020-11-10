import 'package:copy_paste/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'pages/edit_page.dart';
import 'pages/main_page.dart';
import 'pages/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      // routes: {
      //   '/second': (_) => Page2(
      //         data: 'abc',
      //       )
      // },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/EditPage':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => EditPage(data: args));
        }
        return _errorRoute();
      case '/SettingsPage':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SettingsPage(data: args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
      // return MaterialPageRoute(builder: (_) => Page1());
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text("Error")),
          body: Center(child: Text("ERROR")));
    });
  }
}
