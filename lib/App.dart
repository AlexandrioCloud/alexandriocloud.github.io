import 'package:flutter/material.dart';
import 'package:landing_page/AppSettings.dart';
import 'package:landing_page/Pages/HomePage.dart';

class AppState extends State<App> {
  var settings = AppSettings();

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: (settings.darkTheme ? ThemeData.dark() : ThemeData.light()).copyWith(
      primaryColor: settings.color,
      accentColor: settings.color,
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  );
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}