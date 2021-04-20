import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Structure/Structure.dart';

class IdeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map _idea = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            mini: true,
            backgroundColor: _idea["pageTheme"],
            child: Icon(Icons.arrow_drop_up, size: 30, color: Colors.white),
            onPressed: () {}),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 300,
              // elevation: 0,
              title: Container(
                  child: Text(_idea["ideaname"],
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 15))),
              flexibleSpace: FlexibleSpaceBar(
                  // title: Container(
                  //     child: Text(ideaname,
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .headline6
                  //             .copyWith(fontSize: 15)))

                  background: Container(
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset(
                              "lib/Resources/Media/Photos/Background/background7.jpg")))),
              actions: [
                InkWell(
                    splashColor: _idea["pageTheme"],
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                        child: Icon(Icons.search_rounded)))
              ]),
          // SliverToBoxAdapter(
          //     child: Container(
          //         margin: const EdgeInsets.only(bottom: 5),
          //         height: 50,
          //         color: Colors.white)),
          Structure(
              pageTheme: _idea["pageTheme"], structure: _idea["structure"])
        ]));
  }
}

class Cover extends StatelessWidget {
  final String ideaname;
  final Color pageTheme;

  const Cover({this.ideaname, this.pageTheme});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(ideaname ?? "",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 30, color: pageTheme)));
  }
}
