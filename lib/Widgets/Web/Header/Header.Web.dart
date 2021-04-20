import 'package:flutter/material.dart';
import 'package:scribbly/Widgets/Mobile/TabBars/TopTabBar.dart';

class WebHeader extends StatelessWidget {
  final Color pageTheme;
  final Duration duration;
  final bool hideHeader;
  final String page;
  final PageController topTabController;

  const WebHeader(
      {Key key,
      this.duration,
      this.hideHeader,
      this.page,
      this.pageTheme,
      this.topTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        top: hideHeader ? -100 : 0,
        duration: duration,
        child: AnimatedOpacity(
            duration: duration,
            opacity: hideHeader ? 0 : 1,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                height: 50,
                width: MediaQuery.of(context).size.width - 420,
                // width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 1)
                    ]),
                child: page == "feed"
                    ? Row(
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: FittedBox(
                                        child: CircleAvatar(
                                            backgroundColor: Colors.grey[200],
                                            backgroundImage: AssetImage(
                                                "lib/Resources/Profile/dp.jpeg"),
                                            minRadius: 14)))),
                          ])
                    : Row(children: [
                        TopTabBar(
                            web: true,
                            controller: topTabController,
                            tabs: <String>[
                              "private",
                              "shared",
                              "public",
                              "saved"
                            ],
                            theme: pageTheme),
                        Expanded(child: Container())
                      ]))));
  }
}
