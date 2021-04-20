import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBtns extends StatelessWidget {
  final Function changePage;
  final int pageIndex;

  const HomeBtns({Key key, this.changePage, this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.start, children: [
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
            InkWell(
                onTap: () => changePage(0), //? library...
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(FontAwesomeIcons.feather,
                        size: 18,
                        color: pageIndex == 0
                            ? Colors.redAccent
                            : Theme.of(context).accentColor))),
            SizedBox(height: 10),
            Text("library",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 10, fontWeight: FontWeight.bold))
          ])),
      SizedBox(width: 30),
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
            InkWell(
                onTap: () => changePage(1), //? feed....
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(FontAwesomeIcons.home,
                        size: 18,
                        color: pageIndex == 1
                            ? Color(0xff4363d8)
                            : Theme.of(context).accentColor))),
            SizedBox(height: 10),
            Text("feed",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 10, fontWeight: FontWeight.bold))
          ])),
      SizedBox(width: 30),
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
            InkWell(
                onTap: () => changePage(2), //? search....
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(FontAwesomeIcons.search,
                        size: 18,
                        color: pageIndex == 2
                            ? Color(0xff243447)
                            : Theme.of(context).accentColor))),
            SizedBox(height: 10),
            Text("search",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 10, fontWeight: FontWeight.bold))
          ])),
      SizedBox(width: 30),
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
            InkWell(
                onTap: () => changePage(3), //? profile...
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.face_rounded,
                        size: 18,
                        color: pageIndex == 3
                            ? Colors.green
                            : Theme.of(context).accentColor))),
            SizedBox(height: 10),
            Text("profile",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 10, fontWeight: FontWeight.bold))
          ])),
      SizedBox(width: 30),
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
            InkWell(
                onTap: () => changePage(4), //? notifications...
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(FontAwesomeIcons.paperPlane,
                        size: 18,
                        color: pageIndex == 4
                            ? Color(0xff800000)
                            : Theme.of(context).accentColor))),
            SizedBox(height: 10),
            Text("notifications",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 10, fontWeight: FontWeight.bold))
          ])),
    ]);
  }
}
