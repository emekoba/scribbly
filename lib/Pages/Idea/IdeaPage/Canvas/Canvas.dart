import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Canvas/StickyCard/StickyCard.dart';
import 'package:scribbly/Widgets/Global/GlobalFunctions.dart';

class Canvas extends StatefulWidget {
  final List structure;
  final Color pageTheme;

  const Canvas({Key key, this.structure, this.pageTheme}) : super(key: key);

  @override
  _CanvasState createState() => _CanvasState();
}

class _CanvasState extends State<Canvas> {
  @override
  Widget build(BuildContext context) {
    PageController _pageCtrl = PageController();

    List<Widget> _blockPages = List<Widget>();

    () {
      sortStructureOffline(structure: widget.structure)
          .forEach((dynamic block) {
        _blockPages.add(block["type"] as String == "clause"
            ? BlockPage.clause(
                pageTheme: widget.pageTheme,
                key: Key(block["paragraphs"].first["value"] as String),
                paragraphs: block["paragraphs"] as List,
                hierarchy: block["hierarchy"] as String,
                contributor: block["contributor"] as Map,
              )
            : BlockPage.query(
                pageTheme: widget.pageTheme,
                key: Key(block["paragraphs"].first["value"] as String),
                paragraphs: block["paragraphs"] as List,
                hierarchy: block["hierarchy"] as String,
                contributor: block["contributor"] as Map,
              ));
      });
    }();

    return Scaffold(
        // backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            backgroundColor: widget.pageTheme,
            child: Icon(Icons.add, size: 30, color: Colors.white),
            onPressed: () {}),
        body: Column(children: [
          Container(
              height: 80,
              padding: EdgeInsets.fromLTRB(15, 30, 20, 0),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 5, color: widget.pageTheme))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                            height: 35,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(3)),
                            child: Icon(Icons.menu, size: 17))),
                    Row(children: [
                      InkWell(
                          onTap: () {},
                          child: Container(
                              height: 35,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Icon(Icons.add, size: 17))),
                      SizedBox(width: 20),
                      InkWell(
                          onTap: () {},
                          child: Container(
                              height: 35,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Icon(Icons.search, size: 17))),
                      SizedBox(width: 20),
                      Container(
                          height: 35,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(3)),
                          child: Ink.image(
                              image:
                                  AssetImage("lib/Resources/Profile/dp.jpeg"),
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              child: InkWell(onTap: () {}))),
                    ])
                  ])),
          Expanded(
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageCtrl,
                  itemBuilder: (ctxt, pos) => _blockPages[pos],
                  itemCount: _blockPages.length))
        ]));
  }
}

class BlockPage extends StatelessWidget {
  String blockPageType;
  final List paragraphs;
  final String hierarchy;
  final Map contributor;
  final Color pageTheme;

  BlockPage.clause(
      {Key key,
      this.paragraphs,
      this.hierarchy,
      this.contributor,
      this.pageTheme})
      : super(key: key) {
    blockPageType = "clause";
  }

  BlockPage.query(
      {Key key,
      this.paragraphs,
      this.hierarchy,
      this.contributor,
      this.pageTheme})
      : super(key: key) {
    blockPageType = "query";
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _cards = List<Widget>();

    () {
      paragraphs.forEach((dynamic par) {
        switch (par["type"] as String) {
          case "text":
            _cards.add(StickyCard.text(
                key: Key(par["value"] as String),
                blockType: blockPageType,
                text: par["value"] as String));
            break;

          case "image":
            _cards.add(StickyCard.image(
                key: Key(par["value"] as String),
                blockType: blockPageType,
                imageUrl: par["value"] as String));
            break;

          case "video":
            _cards.add(StickyCard.video(
                key: Key(par["value"] as String),
                blockType: blockPageType,
                videoUrl: par["value"] as String));
            break;

          case "audio":
            _cards.add(StickyCard.audio(
                key: Key(par["value"] as String),
                blockType: blockPageType,
                audioUrl: par["value"] as String));
            break;

          case "checkbox":
            _cards.add(StickyCard.checkbox(
                key: Key(par["value"] as String),
                blockType: blockPageType,
                entry: par["value"] as String));
            break;

          default:
        }
      });
    }();

    return Expanded(
        child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 5,
                        color: blockPageType == "clause"
                            ? pageTheme
                            : Colors.transparent),
                    right: BorderSide(
                        width: 5,
                        color: blockPageType == "query"
                            ? pageTheme
                            : Colors.transparent))),
            child: Center(
              child: _cards[0],
            )
            //  SingleChildScrollView(child: Row(children: [

            // ])
            ));
  }
}
