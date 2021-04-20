import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scribbly/Pages/Feed/Feed.dart';
import 'package:scribbly/Pages/Library/Library.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';
import 'package:scribbly/Widgets/Web/SideBar/SideBar.dart';

class Scribbly extends StatefulWidget {
  @override
  _ScribblyState createState() => _ScribblyState();
}

class _ScribblyState extends State<Scribbly> {
  PageController _pageController = PageController();

  int _pageIndex = 0;

  Duration _duration = Duration(seconds: 1);

  Map<int, Color> _pageThemes = {
    0: Colors.redAccent,
    1: Colors.blueAccent,
    2: Color(0xff243447),
    3: Colors.green,
    4: Color(0xff800000)
  };

  bool _sidebarOpen = false;

  void _changePage(int index) {
    _pageController.jumpToPage(index);

    setState(() => _pageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    bool _isResponsive = Responsive.isMedLargeScreen(context);

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Column(children: [
              Offstage(
                  offstage: _isResponsive ? false : true,
                  child: AnimatedContainer(
                      duration: _duration,
                      color: _pageThemes[_pageIndex],
                      height: 50)),
              Expanded(
                  child: Row(children: [
                Offstage(
                    offstage: _isResponsive && _sidebarOpen ? false : true,
                    child: SideBar(
                        pageTheme: _pageThemes,
                        pageIndex: _pageIndex,
                        changeRoute: _changePage)),
                Expanded(
                    child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (index) => _changePage(index),
                        controller: _pageController,
                        children: [
                      Library(),
                      Feed(),
                      Container(),
                      Container(),
                      Container()
                    ]))
              ]))
            ]),
            bottomNavigationBar: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: Theme.of(context).primaryColor),
                child: Offstage(
                    offstage: _isResponsive ? true : false,
                    child: BottomNavigationBar(
                        elevation: 3,
                        currentIndex: _pageIndex,
                        onTap: (index) => _changePage(index),
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        items: [
                          BottomNavigationBarItem(
                              label: "library",
                              icon: Icon(FontAwesomeIcons.feather,
                                  size: 18,
                                  color: _pageIndex == 0
                                      ? Colors.redAccent
                                      : Theme.of(context).accentColor)),
                          BottomNavigationBarItem(
                              label: "feed",
                              icon: Icon(FontAwesomeIcons.home,
                                  size: 18,
                                  color: _pageIndex == 1
                                      ? Color(0xff4363d8)
                                      : Theme.of(context).accentColor)),
                          BottomNavigationBarItem(
                              label: "search",
                              icon: Icon(FontAwesomeIcons.search,
                                  size: 18,
                                  color: _pageIndex == 2
                                      ? Color(0xff243447)
                                      : Theme.of(context).accentColor)),
                          BottomNavigationBarItem(
                              label: "profile",
                              icon: Icon(Icons.face_rounded,
                                  color: _pageIndex == 3
                                      ? Colors.green
                                      : Theme.of(context).accentColor)),
                          BottomNavigationBarItem(
                              label: "notifications",
                              icon: Icon(FontAwesomeIcons.paperPlane,
                                  size: 18,
                                  color: _pageIndex == 4
                                      ? Color(0xff800000)
                                      : Theme.of(context).accentColor)),
                        ])))));
  }
}
