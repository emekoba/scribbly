import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Block/Block.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Paragraph/Paragraph.dart';

class CollpasedBlock extends StatelessWidget {
  final List paragraphs;
  final String hierarchy;
  final Map contributor;
  final Color pageTheme;
  final List structure;
  final String type;

  const CollpasedBlock(
      {Key key,
      this.paragraphs,
      this.hierarchy,
      this.contributor,
      this.pageTheme,
      this.structure,
      this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> _margins = <double>[0, 5, 10, 15];

    List<Widget> _paragraphs = [];

    void _expandBlock() {
      Navigator.of(context).push<dynamic>(PageTransition(
          type: PageTransitionType.slideInLeft,
          child: Block.expanded(structure: structure, pageTheme: pageTheme)));
    }

    return type == "clause"
        ? Container(
            constraints: BoxConstraints(minHeight: 100),
            margin: EdgeInsets.only(left: 0, top: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(width: 5, color: pageTheme),
                  // bottom: BorderSide(width: 0.5, color: pageTheme),
                  // top: BorderSide(width: 0.5, color: pageTheme),
                  // right: BorderSide(width: 0.5, color: pageTheme),
                )),
            child: InkWell(
                onTap: _expandBlock,
                splashColor: pageTheme,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Offstage(
                          offstage: contributor["name"] == "" ? true : false,
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 2, color: pageTheme)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            // child:
                                            // Image.asset(
                                            //     contributor["dp"] as String,
                                            //     height: 35,
                                            //     width: 40,
                                            //     fit: BoxFit.cover)
                                          )),
                                      SizedBox(width: 15),
                                      Text(contributor["name"] as String ?? "",
                                          textAlign: type == "clause"
                                              ? TextAlign.start
                                              : TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(fontSize: 13))
                                    ]),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 2, color: pageTheme)),
                                        child: Row(children: [
                                          InkWell(
                                              onTap: () {},
                                              splashColor: pageTheme,
                                              child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  child: Icon(
                                                      Icons.thumb_up_rounded,
                                                      size: 16,
                                                      color: true
                                                          ? pageTheme
                                                          : Colors.white))),
                                          SizedBox(width: 10),
                                          Text("24k",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4
                                                  .copyWith(fontSize: 12)),
                                          SizedBox(width: 10),
                                          InkWell(
                                              onTap: () {},
                                              splashColor: pageTheme,
                                              child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  child: Icon(
                                                      Icons.thumb_down_rounded,
                                                      size: 16,
                                                      color: false
                                                          ? Theme.of(context)
                                                              .buttonColor
                                                          : Colors.grey)))
                                        ])),
                                  ]))),
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: Wrap(
                              children: paragraphs
                                  .map((e) => Paragraph.plain(
                                      key: Key(e["value"] as String),
                                      blockType: type,
                                      value: e["value"] as String))
                                  .toList()))
                    ])))
        : Container(
            constraints: BoxConstraints(minHeight: 100),
            margin: EdgeInsets.only(left: 0, top: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(width: 5, color: pageTheme),
                  // bottom: BorderSide(width: 0.5, color: pageTheme),
                  // top: BorderSide(width: 0.5, color: pageTheme),
                  // right: BorderSide(width: 0.5, color: pageTheme),
                )),
            child: InkWell(
                onTap: _expandBlock,
                splashColor: pageTheme,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Offstage(
                          offstage: contributor["name"] == "" ? true : false,
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 2, color: pageTheme)),
                                        child: Row(children: [
                                          InkWell(
                                              onTap: () {},
                                              splashColor: pageTheme,
                                              child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  child: Icon(
                                                      Icons.thumb_up_rounded,
                                                      size: 16,
                                                      color: true
                                                          ? pageTheme
                                                          : Colors.white))),
                                          SizedBox(width: 10),
                                          Text("24k",
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4
                                                  .copyWith(fontSize: 12)),
                                          SizedBox(width: 10),
                                          InkWell(
                                              onTap: () {},
                                              splashColor: pageTheme,
                                              child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  child: Icon(
                                                      Icons.thumb_down_rounded,
                                                      size: 16,
                                                      color: false
                                                          ? Theme.of(context)
                                                              .buttonColor
                                                          : Colors.grey)))
                                        ])),
                                    Row(children: [
                                      Text(contributor["name"] as String ?? "",
                                          textAlign: type == "clause"
                                              ? TextAlign.start
                                              : TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(fontSize: 13)),
                                      SizedBox(width: 15),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 2, color: pageTheme)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            // child: Image.asset(
                                            //     contributor["dp"] as String,
                                            //     height: 35,
                                            //     width: 40,
                                            //     fit: BoxFit.cover)
                                          ))
                                    ])
                                  ]))),
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: Wrap(
                              alignment: WrapAlignment.end,
                              children: _paragraphs))
                    ])));
  }
}
