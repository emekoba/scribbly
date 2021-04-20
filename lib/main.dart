import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Feed/Feed.dart';
import 'package:scribbly/Pages/Library/Library.dart';
import 'package:scribbly/Scribbly.dart';
import 'package:scribbly/Widgets/Global/Style/AppTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scribbly',
        theme: AppTheme.light,
        darkTheme: AppTheme.light,
        initialRoute: '/',
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => Container(), settings: settings),
        onGenerateRoute: (settings) {
          Widget page;

          if (settings.name == "/auth")
            page = AuthenticationWrapper();
          else if (settings.name == "/")
            page = Scribbly();
          else
            throw Exception('Unknown route: ${settings.name}');

          return MaterialPageRoute(
              builder: (context) => page, settings: settings);
        });
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scribbly();
  }
}
