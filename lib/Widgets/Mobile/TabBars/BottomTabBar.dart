import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  final PageController controller;

  const BottomTabBar({this.controller});

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  String _currentPage = "Sign In";

  void _changePage(String text) {
    switch (text) {
      case "Sign In":
        setState(() => _currentPage = text);

        widget.controller.jumpToPage(0);

        break;

      case "Sign Up":
        setState(() => _currentPage = text);

        widget.controller.jumpToPage(1);

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _broo({String text}) {
      return Expanded(
          child: GestureDetector(
              onTap: () => _changePage(text),
              child: Container(
                  // duration: Duration(milliseconds: 300),
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: text == _currentPage
                          ? Colors.white
                          : Theme.of(context).accentColor),
                  child: Center(
                      child: Text(text,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: text == _currentPage
                                  ? Theme.of(context).primaryColor
                                  : Colors.white))))));
    }

    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).accentColor),
        child: Row(children: [_broo(text: "Sign In"), _broo(text: "Sign Up")]));
  }
}
