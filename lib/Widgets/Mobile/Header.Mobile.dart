import 'package:flutter/material.dart';
import 'package:scribbly/Widgets/Global/Functional/SearchBox.dart';
import 'package:scribbly/Widgets/Mobile/TabBars/TopTabBar.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';

class MobileHeader extends StatelessWidget {
  final String page;
  final Color pageTheme;
  final PageController topTabControl;

  const MobileHeader({Key key, this.page, this.pageTheme, this.topTabControl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _responsive = Responsive.isMedLargeScreen(context);

    return page == "feed"
        ? SliverAppBar(
            // expandedHeight: 70,
            // floating: true,
            title: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 38,
                    width: 38),
                Container(
                    height: 50,
                    width: 85,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                                "lib/Resources/Splash/scribbly.png")))),
                Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: FittedBox(
                            child: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage:
                                    AssetImage("lib/Resources/Profile/dp.jpeg"),
                                minRadius: 14)))),
              ])))
        : Container(
            color: Theme.of(context).primaryColor,
            child: Column(children: [
              Container(
                  padding: EdgeInsets.fromLTRB(15, _responsive ? 30 : 15,
                      _responsive ? 30 : 20, _responsive ? 30 : 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 70,
                                  margin: EdgeInsets.only(left: 5, right: 20),
                                  child: Stack(children: [
                                    FittedBox(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                backgroundImage: AssetImage(
                                                    "lib/Resources/Splash/s.jpg"),
                                                minRadius: 17))),
                                    Positioned(
                                        left: 30,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: FittedBox(
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.grey[200],
                                                    backgroundImage: AssetImage(
                                                        "lib/Resources/Profile/dp.jpeg"),
                                                    minRadius: 15))))
                                  ])),
                              Container(
                                  decoration: BoxDecoration(
                                      color: pageTheme,
                                      borderRadius: BorderRadius.circular(
                                          _responsive ? 5 : 8)),
                                  padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                                  child: Text("library",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)))
                            ]),

                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: SearchBox(theme: pageTheme))

                        // InkWell(
                        //     splashColor: pageTheme,
                        //     borderRadius: BorderRadius.circular(50),
                        //     onTap: () {},
                        //     child: Padding(
                        //         padding: const EdgeInsets.all(8),
                        //         child: Icon(Icons.search_rounded))),
                      ])),
              TopTabBar(
                  theme: pageTheme,
                  controller: topTabControl,
                  tabs: <String>["private", "shared", "public", "saved"])
            ]));
  }
}
