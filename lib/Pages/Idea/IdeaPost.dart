import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/IdeaPage.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:scribbly/Widgets/Global/Dumb/TagList.dart';

class IdeaPost extends StatelessWidget {
  final String ideaname;
  final List tags;
  final String username;
  AssetImage userdp;
  final String date;
  final String description;
  final Map cover;
  final List structure;
  final Color pageTheme;

  String ideaType;

  IdeaPost.private(
      {this.ideaname,
      this.tags,
      this.username,
      this.date,
      this.description,
      this.cover,
      this.structure,
      this.pageTheme}) {
    ideaType = "private";
  }

  IdeaPost.shared(
      {this.ideaname,
      this.tags,
      this.username,
      this.userdp,
      this.date,
      this.description,
      this.cover,
      this.structure,
      this.pageTheme}) {
    ideaType = "shared";
  }

  IdeaPost.public(
      {this.ideaname,
      this.tags,
      this.username,
      this.userdp,
      this.date,
      this.description,
      this.cover,
      this.structure,
      this.pageTheme}) {
    ideaType = "public";
  }

  @override
  Widget build(BuildContext context) {
    void _openIdea() {
      // Navigator.of(context).push<dynamic>(PageTransition(
      //     type: PageTransitionType.slideInLeft,
      //     child: IdeaPage(
      //         pageTheme: pageTheme, ideaname: ideaname, structure: structure)));

      Navigator.pushNamed(context, '/idea-page', arguments: {
        'ideaname': ideaname,
        'tags': tags,
        'username': username,
        'date': date,
        'description': description,
        'cover': cover,
        'structure': structure,
        'pageTheme': pageTheme,
        'userdp': userdp
      });
    }

    void _openIdeaOptions() {
      // showModalBottomSheet<Widget>(
      //     backgroundColor: Theme.of(context).primaryColor,
      //     context: context,
      //     builder: (context) {
      //       return PostOptions();
      //     });
    }

    return GestureDetector(
        onTap: _openIdea,
        onLongPress: _openIdeaOptions,
        child: Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
            padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
            constraints: BoxConstraints(minHeight: 100),
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ideaname ?? "",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Offstage(
                          offstage: tags == null,
                          child: TagList(pageTheme: pageTheme, tags: tags)),
                      Text(description ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 13, height: 1.5)),
                      SizedBox(height: 30),
                      Offstage(
                          offstage:
                              ideaType == "private" || ideaType == "shared",
                          child: Row(children: [
                            Icon(Icons.face_rounded,
                                color: Theme.of(context).accentColor, size: 20),
                            Expanded(child: Container()),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: Icon(Icons.arrow_upward_rounded,
                                          color: pageTheme, size: 20)),
                                  SizedBox(width: 10),
                                  Text("2k",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontSize: 12)),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Icon(Icons.arrow_downward_rounded,
                                          color: Theme.of(context).accentColor,
                                          size: 20))
                                ])
                          ]))
                    ]))));
  }
}

class PostOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Text("Delete idea",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20, color: Theme.of(context).accentColor)),
          Text("change to shared",
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 20, color: Theme.of(context).accentColor)),
        ]));
  }
}
