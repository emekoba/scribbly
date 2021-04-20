import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/IdeaPage.dart';
import 'package:scribbly/Pages/Library/Private.dart';
import 'package:scribbly/Widgets/Mobile/Header.Mobile.dart';
import 'package:scribbly/Widgets/Web/Header/Header.Web.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';

class Library extends StatefulWidget {
  const Library({Key key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  PageController _topTabControl = PageController();

  Color _pageTheme = Colors.redAccent;

  Duration _duration = Duration(milliseconds: 500);

  bool _hideHeader = false, _upDirection = true, _flag = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        _upDirection = _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;

        if (_upDirection != _flag) if (_hideHeader == false)
          setState(() => _hideHeader = true);
        else if (_hideHeader) setState(() => _hideHeader = false);

        _flag = _upDirection;
      });
  }

  @override
  Widget build(BuildContext context) {
    final _navigatorKey = Key("navigator");

    Widget _getRoute(settings) {
      Widget _page = Container();

      switch (settings.name) {
        case '/idea-page':
          _page = IdeaPage();
          break;

        default:
          _page = Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: _pageTheme,
                  child: Icon(Icons.add, color: Colors.white),
                  onPressed: () {}),
              body: Column(children: [
                Offstage(
                    offstage:
                        Responsive.isMedLargeScreen(context) ? true : false,
                    child: MobileHeader(
                        topTabControl: _topTabControl,
                        pageTheme: _pageTheme,
                        page: "library")),
                Expanded(
                    child: Stack(children: [
                  Scrollbar(
                      isAlwaysShown: true,
                      radius: Radius.zero,
                      controller: _scrollController,
                      child: PageView(
                          controller: _topTabControl,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Private(
                                scrollController: _scrollController,
                                pageTheme: _pageTheme),
                            Container(child: Center(child: Text("shared"))),
                            Container(child: Center(child: Text("public"))),
                            Container(child: Center(child: Text("saved"))),
                          ])),
                  // Offstage(
                  //     offstage:
                  //         Responsive.isMedLargeScreen(context) ? false : true,
                  //     child: WebHeader(
                  //         topTabController: _topTabControl,
                  //         pageTheme: _pageTheme,
                  //         page: "library",
                  //         hideHeader: _hideHeader,
                  //         duration: _duration))
                ]))
              ]));
      }

      return _page;
    }

    Route _onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => _getRoute(settings), settings: settings);

    return SafeArea(
        child:
            Navigator(key: _navigatorKey, onGenerateRoute: _onGenerateRoute));
  }
}
