import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/IdeaPage.dart';
import 'package:scribbly/Pages/Idea/IdeaPost.dart';
import 'package:scribbly/Resources/Resources.dart';
import 'package:scribbly/Widgets/Mobile/Header.Mobile.dart';
import 'package:scribbly/Widgets/Web/Header/Header.Web.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';

class Feed extends StatefulWidget {
  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  Color _pageTheme = Colors.blueAccent;

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
    List<Widget> _ideas = [];

    () {
      feed_ideas.forEach((dynamic key, dynamic value) => _ideas.add(IdeaPost.public(
          pageTheme: _pageTheme,
          ideaname: key.toString(),
          username: value["username"] as String,
          // userdp: value["userdp"] as AssetImage, //! no userdp for private...
          description: value["description"] as String,
          tags: value["tags"] as List,
          date: value["date"] as String,
          cover: value["cover"] as Map,
          structure: value["structure"] as List)));
    }();

    final _navigatorKey = Key("navigator");

    Widget _getRoute(settings) {
      Widget _page = Container();

      switch (settings.name) {
        case '/idea-page':
          _page = IdeaPage();
          break;

        default:
          _page = Scaffold(
              body: Responsive.isMedLargeScreen(context)
                  ? Stack(children: [
                      Scrollbar(
                          isAlwaysShown: true,
                          radius: Radius.zero,
                          controller: _scrollController,
                          child: StaggeredGridView.countBuilder(
                              controller: _scrollController,
                              padding: EdgeInsets.fromLTRB(5, 80, 14, 20),
                              crossAxisCount: 4,
                              itemCount: _ideas.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  _ideas[index],
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.fit(
                                      Responsive.isMedLargeScreen(context)
                                          ? 1
                                          : 2))),
                      WebHeader(
                          page: "feed",
                          hideHeader: _hideHeader,
                          duration: _duration)
                    ])
                  : CustomScrollView(slivers: [
                      MobileHeader(page: "feed"),
                      SliverList(
                          delegate: SliverChildListDelegate(
                              [..._ideas, SizedBox(height: 50)])),
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
