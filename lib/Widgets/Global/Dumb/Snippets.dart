import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:scribbly/Pages/Lectures/Lesson/LessonPost/LessonPost.dart';
import 'package:provider/provider.dart';
// import 'package:scribbly/mainBloc.dart';
// import 'package:timeline_tile/timeline_tile.dart';

class Snippets extends StatefulWidget {
  @override
  _SnippetsState createState() => _SnippetsState();
}

class _SnippetsState extends State<Snippets> {
  PageController _page = PageController();

  int _pageIndex = 0;

  bool _pageEntered = false;

  Map _bruh = <String, dynamic>{"bruhhh": false};

  bool _inLibrary = true;

  void _saveToLibrary() {}

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      // _restartTimer();
      // _scoreTest(question, answer);

      // timer.cancel();
    });

    Future.delayed(Duration.zero, () {
      // _skippedColor = Theme.of(context).buttonColor;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final MainBloc mainBloc = Provider.of<MainBloc>(context);

    () {
      if (!_pageEntered) {
        // mainBloc.onPageEntered(pageName: "laws and docs");

        setState(() {
          _pageEntered = true;
        });
      }
    }();

    _expandCategory(String category) {
      Navigator.push(
          context, MaterialPageRoute<Widget>(builder: (context) => null));

      showModalBottomSheet<Widget>(
        context: context,
        builder: (ctx) {
          return Container();
        },
        // enableDrag: false,
        // isScrollControlled: true,
      );
    }

    void _changePage(int index) {
      _page.jumpToPage(index);

      setState(() {
        _pageIndex = index;
      });
    }

// void _init_forums() async {
//   QuerySnapshot snapshot = await forumsCollection
//       .where("createdBy", isEqualTo: fire_user)
//       .get();

//   snapshot.docs.forEach((DocumentSnapshot doc) {
//     _created_forums[doc.id] = doc.data();
//   });
// }

//  Firestore.instance
//     .collection('books').snapshots().listen((querySnapshot){

// });

    return Scaffold(
      floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 10, bottom: 20),
          child: FloatingActionButton(
              backgroundColor: Theme.of(context).buttonColor,
              child: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
              onPressed: () {})),
      body: Column(children: [
        //? subheader snippet...
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 10),
                  child: Text("Recent Tests",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 20, color: Theme.of(context).accentColor))),
              Divider(),
            ])),

        //? Text snippet...
        Text("",
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 15)),

        Ink.image(
            image: AssetImage("lib/Resources/Profile/dp.jpeg"),
            fit: BoxFit.cover,
            width: 50,
            height: 50,
            child: InkWell(onTap: () {})),

        Image.asset("lib/Resources/Profile/dp.jpeg",
            height: 30, width: 30, fit: BoxFit.cover),

        FittedBox(
            child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage("lib/Resources/Profile/dp.jpeg"),
                minRadius: 18)),

        GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: _bruh.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10, crossAxisSpacing: 10, mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              dynamic key = _bruh.keys.elementAt(index);
            }),

        ListView.builder(
            itemCount: _bruh.length,
            itemBuilder: (context, index) {
              dynamic key = _bruh.keys.elementAt(index);
            }),

        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: IconButton(
                icon: Icon(
                    _inLibrary
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: Theme.of(context).iconTheme.color),
                iconSize: 16,
                onPressed: _saveToLibrary)),

        Expanded(
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _page,
                onPageChanged: (index) => _changePage(index),
                children: [])),
        Expanded(
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                // controller: _pageTab,
                itemBuilder: (ctxt, pos) {
                  // return _tabs[pos];
                },
                itemCount: 3)),
        Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "lib/Resources/Media/Photos/Background/background8.jpg")),
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10))),

        // DropdownButton<dynamic>(
        //                   value: 1,
        //                   onChanged: (dynamic value) {},
        //                   items: _occupations
        //                       .map<DropdownMenuItem>((dynamic e) {
        //                     setState(() {
        //                       _index++;
        //                     });

        //                     return DropdownMenuItem<dynamic>(
        //                         value: _index,
        //                         child: Text(_index.toString()));
        //                   }).toList())),
      ]),
      bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
              selectedItemColor: Theme.of(context).buttonColor,
              unselectedItemColor: Theme.of(context).accentColor,
              currentIndex: _pageIndex,
              onTap: (index) => _changePage(index),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    label: "feed", icon: Icon(Icons.home_rounded)),
                BottomNavigationBarItem(
                    label: "search",
                    icon: Icon(FontAwesomeIcons.search, size: 18)),
                BottomNavigationBarItem(
                    label: "profile", icon: Icon(Icons.person))
              ])),
    );
  }
}

class StateFulPageView extends StatefulWidget {
  @override
  _StateFulPageViewState createState() => _StateFulPageViewState();
}

class _StateFulPageViewState extends State<StateFulPageView>
    with AutomaticKeepAliveClientMixin<StateFulPageView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}

// SliverAppBar(
//     elevation: 0,
//     expandedHeight: 130,
//     leading: Offstage(),
//     floating: true,
//     flexibleSpace: FlexibleSpaceBar(
//         background:
//             Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//       Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: RaisedButton(
//               color: Theme.of(context).buttonColor,
//               shape: CircleBorder(),
//               onPressed: () {},
//               child: Icon(Icons.read_more_outlined,
//                   size: 18, color: Theme.of(context).iconTheme.color))),
//       Expanded(
//           child: Row(mainAxisSize: MainAxisSize.max, children: [
//         Container(
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                       color: Theme.of(context).accentColor,
//                       offset: Offset(0, 2), //(x,y)
//                       blurRadius: 0.8)
//                 ],
//                 color: Theme.of(context).buttonColor,
//                 borderRadius: BorderRadius.circular(20)),
//             padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
//             child: Text("library",
//                 style:
//                     TextStyle(fontSize: 13, fontWeight: FontWeight.bold)))
//       ]))
//     ])),
//     bottom: TabBar(controller: _controller, tabs: [
//       Tab(icon: Icon(Icons.receipt, size: 15)),
//       Tab(icon: Icon(FontAwesomeIcons.newspaper, size: 15)),
//       Tab(icon: Icon(FontAwesomeIcons.folder, size: 15)),
//       Tab(icon: Icon(Icons.comment, size: 16))
//     ])),
