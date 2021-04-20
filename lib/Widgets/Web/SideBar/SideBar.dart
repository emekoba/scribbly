import 'package:flutter/material.dart';
import 'package:scribbly/Widgets/Global/Functional/SearchBox.dart';
import 'package:scribbly/Widgets/Web/SideBar/HomeBtns.dart';

class SideBar extends StatefulWidget {
  final int pageIndex;
  final Function changeRoute;
  final Map<int, Color> pageTheme;

  const SideBar({Key key, this.changeRoute, this.pageIndex, this.pageTheme})
      : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        width: MediaQuery.of(context).size.width / 4.5,
        color: Theme.of(context).primaryColor,
        child: Column(children: [
          // SearchBox(theme: _sidebarThemes[widget.pageIndex]),
          // Container(
          //     height: 50,
          //     width: 85,
          //     decoration: BoxDecoration(
          //         image: DecorationImage(
          //             fit: BoxFit.contain,
          //             image: AssetImage("lib/Resources/Splash/scribbly.png")))),

          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 50,
          ),
          SizedBox(height: 30),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 50,
          ),

          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                HomeBtns(
                    changePage: widget.changeRoute, pageIndex: widget.pageIndex)
              ]))
        ]));
  }
}
