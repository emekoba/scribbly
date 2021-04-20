import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Feed/Feed.dart';
import 'package:scribbly/Pages/Library/Library.dart';

class WebRouter extends StatefulWidget {
  final RouteSettings settings;

  const WebRouter({Key key, this.settings}) : super(key: key);

  @override
  WebRouterState createState() => WebRouterState();
}

class WebRouterState extends State<WebRouter> {
  Widget _getRoute() {
    Widget page = Container();

    switch (widget.settings.name) {
      case '/library':
        page = Library();
        break;

      case '/feed':
        page = Feed();
        break;

      case '/search':
        page = Container();
        break;
    }

    return page;
  }

  void changeWebRouter() {
    Navigator.pushNamed(context, '/library');
  }

  @override
  Widget build(BuildContext context) {
    return _getRoute();
  }
}
