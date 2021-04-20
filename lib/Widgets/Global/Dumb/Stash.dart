
    // () {
    //   paragraphs.forEach((dynamic par) {
    //     switch (par["type"] as String) {
    //       case "text":
    //         _paragraphs.add(Paragraph.text(
    //             key: Key(par["value"] as String),
    //             blockType: blockType,
    //             text: par["value"] as String));
    //         break;

    //       case "image":
    //         _paragraphs.add(Paragraph.image(
    //             key: Key(par["value"] as String),
    //             blockType: blockType,
    //             imageUrl: par["value"] as String));
    //         break;

    //       case "video":
    //         _paragraphs.add(Paragraph.video(
    //             key: Key(par["value"] as String),
    //             blockType: blockType,
    //             videoUrl: par["value"] as String));
    //         break;

    //       case "audio":
    //         _paragraphs.add(Paragraph.audio(
    //             key: Key(par["value"] as String),
    //             blockType: blockType,
    //             audioUrl: par["value"] as String));
    //         break;

    //       case "checkbox":
    //         _paragraphs.add(Paragraph.checkbox(
    //             key: Key(par["value"] as String),
    //             blockType: blockType,
    //             entry: par["value"] as String));
    //         break;

    //       default:
    //     }
    //   });
    // }();


    
//  final Map contributor;
//   final String blockType;

//   bool checked;
//   String entry;
//   String imageUrl;
//   String videoUrl;
//   String audioUrl;
//   String text;

//   String paragraphType;


//  if (paragraphType == "text") {
//       return Container(
//           width: double.infinity,
//           child: Text(text.toString(),
//               textAlign:
//                   blockType == "clause" ? TextAlign.start : TextAlign.end,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline6
//                   .copyWith(fontSize: 14, height: 1.5)));
//     } else if (paragraphType == "image") {
//       return Container(
//           margin: blockType == "clause"
//               ? const EdgeInsets.fromLTRB(0, 15, 20, 0)
//               : const EdgeInsets.fromLTRB(20, 15, 0, 0),
//           height: 45,
//           width: 65,
//           decoration: BoxDecoration(
//               border: Border.all(
//                   width: 2, color: Theme.of(context).scaffoldBackgroundColor),
//               borderRadius: BorderRadius.circular(3)),
//           child: ClipRRect(
//               borderRadius: BorderRadius.circular(3),
//               child: Image.asset(imageUrl, fit: BoxFit.cover)));
//     } else if (paragraphType == "video") {
//       return Container(
//           margin: blockType == "clause"
//               ? const EdgeInsets.fromLTRB(0, 15, 20, 0)
//               : const EdgeInsets.fromLTRB(20, 15, 0, 0),
//           height: 45,
//           width: 65,
//           decoration: BoxDecoration(
//               color: Colors.redAccent,
//               border: Border.all(
//                   width: 2, color: Theme.of(context).scaffoldBackgroundColor),
//               borderRadius: BorderRadius.circular(5)),
//           child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28));
//     } else if (paragraphType == "audio") {
//       return Container(
//           margin: blockType == "clause"
//               ? const EdgeInsets.fromLTRB(0, 15, 20, 0)
//               : const EdgeInsets.fromLTRB(20, 15, 0, 0),
//           height: 45,
//           width: 65,
//           decoration: BoxDecoration(
//               color: Colors.blue,
//               border: Border.all(
//                   width: 2, color: Theme.of(context).scaffoldBackgroundColor),
//               borderRadius: BorderRadius.circular(5)),
//           child: Icon(Icons.audiotrack_rounded, color: Colors.white));
//     }


  // Paragraph.text({Key key, this.text, this.contributor, this.blockType})
  //     : super(key: key) {
  //   paragraphType = "text";
  // }

  // Paragraph.image({Key key, this.imageUrl, this.contributor, this.blockType})
  //     : super(key: key) {
  //   paragraphType = "image";
  // }

  // Paragraph.video({Key key, this.videoUrl, this.contributor, this.blockType})
  //     : super(key: key) {
  //   paragraphType = "video";
  // }

  // Paragraph.audio({Key key, this.audioUrl, this.contributor, this.blockType})
  //     : super(key: key) {
  //   paragraphType = "audio";
  // }

  // Paragraph.checkbox(
  //     {Key key, this.entry, this.checked, this.contributor, this.blockType})
  //     : super(key: key) {
  //   paragraphType = "audio";
  // } 












//  CustomScrollView(slivers: [
//               SliverAppBar(
//                   automaticallyImplyLeading: false,
//                   expandedHeight: 120,
//                   title: Container(
//                       padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       width: 70,
//                                       margin:
//                                           EdgeInsets.only(left: 5, right: 20),
//                                       child: Stack(children: [
//                                         FittedBox(
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                     border:
//                                                         Border.all(width: 2),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20)),
//                                                 child: CircleAvatar(
//                                                     backgroundColor:
//                                                         Colors.grey[200],
//                                                     backgroundImage: AssetImage(
//                                                         "lib/Resources/Splash/s.jpg"),
//                                                     minRadius: 17))),
//                                         Positioned(
//                                             left: 30,
//                                             child: Container(
//                                                 decoration: BoxDecoration(
//                                                     border:
//                                                         Border.all(width: 2),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20)),
//                                                 child: FittedBox(
//                                                     child: CircleAvatar(
//                                                         backgroundColor:
//                                                             Colors.grey[200],
//                                                         backgroundImage: AssetImage(
//                                                             "lib/Resources/Profile/dp.jpeg"),
//                                                         minRadius: 15))))
//                                       ])),
//                                   Container(
//                                       decoration: BoxDecoration(
//                                           color: _pageTheme,
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                       padding:
//                                           EdgeInsets.fromLTRB(18, 10, 18, 10),
//                                       child: Text("library",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headline6
//                                               .copyWith(
//                                                   color: Theme.of(context)
//                                                       .primaryColor,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15)))
//                                 ]),
//                             InkWell(
//                                 splashColor: _pageTheme,
//                                 borderRadius: BorderRadius.circular(50),
//                                 onTap: () {},
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Icon(Icons.search_rounded,
//                                         color: Colors.blue))),
//                           ])),
//                   floating: true,
//                   pinned: true,
//                   bottom: PreferredSize(
//                       preferredSize: Size(double.infinity, 100),
//                       child: TopTabBar(
//                           theme: _pageTheme,
//                           controller: _pageControl,
//                           tabs: <String>[
//                             "private",
//                             "shared",
//                             "public",
//                             "saved"
//                           ]))),
//               SliverFillRemaining(
//                   child: PageView(
//                       controller: _pageControl,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: [
//                     Private(pageTheme: _pageTheme),
//                     Container(child: Center(child: Text("shared"))),
//                     Container(child: Center(child: Text("public"))),
//                     Container(child: Center(child: Text("saved"))),
//                   ]))
//             ])






















// List structure = <dynamic>[
//   {
//     "paragraphs": [
//       {
//         "type": "text",
//         "value": "Edmund",
//         "timestamp": "",
//       },
//       {
//         "type": "text",
//         "value": "every issue covers the process concurrently",
//         "timestamp": "",
//       },
//     ],
//     "parent": "genesis",
//     "type": "clause",
//     "hierarchy": 0,
//     "contributor": <String, dynamic>{"name": "", "dp": ""},
//   },
//   {
//     "paragraphs": [
//       {
//         "type": "text",
//         "value": "Russell",
//         "timestamp": "",
//       },
//       {
//         "type": "text",
//         "value": "every issue covers the process concurrently",
//         "timestamp": "",
//       },
//     ],
//     "parent": "Edmund",
//     "type": "clause",
//     "hierarchy": 1,
//     "contributor": <String, dynamic>{"name": "", "dp": ""},
//   },
//   {
//     "paragraphs": [
//       {
//         "type": "text",
//         "value": "Baron",
//         "timestamp": "",
//       },
//       {
//         "type": "text",
//         "value": "every issue covers the process concurrently",
//         "timestamp": "",
//       },
//     ],
//     "parent": "Edmund",
//     "type": "clause",
//     "hierarchy": 3,
//     "contributor": <String, dynamic>{"name": "", "dp": ""},
//   },
//   {
//     "paragraphs": [
//       {
//         "type": "text",
//         "value": "Jarvis",
//         "timestamp": "",
//       },
//       {
//         "type": "text",
//         "value": "every issue covers the process concurrently",
//         "timestamp": "",
//       },
//     ],
//     "parent": "Russell",
//     "type": "clause",
//     "hierarchy": 2,
//     "contributor": <String, dynamic>{"name": "", "dp": ""},
//   },
// ];

  
  
  
  
  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //           margin: EdgeInsets.only(left: 5, right: 25),
                  //           child: FittedBox(
                  //               child: CircleAvatar(
                  //                   backgroundColor: Colors.grey[200],
                  //                   backgroundImage: AssetImage(
                  //                       "lib/Resources/Profile/dp.jpeg"),
                  //                   minRadius: 18))),
                        // Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.redAccent,
                        //         borderRadius: BorderRadius.circular(10)),
                        //     padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                        //     child: Text("library",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .headline6
                        //             .copyWith(
                        //                 color:
                        //                     Theme.of(context).primaryColor,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 15)))
                  //     ])),





//                   import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:scribbly/Pages/Idea/IdeaPost.dart';
// import 'package:scribbly/Resources/Resources.dart';
// import 'package:scribbly/Widgets/Functional/PageHeader.dart';
// import 'package:masonry_grid/masonry_grid.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:scribbly/Widgets/Functional/TabBars/TopTabBar.dart';

// class Library extends StatefulWidget {
//   @override
//   _LibraryState createState() => _LibraryState();
// }

// class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
//   TabController _tabController;

//   PageController _pageControl = PageController();

//   int _tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();

//     _tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             floatingActionButton: FloatingActionButton(
//                 backgroundColor: Colors.redAccent,
//                 child:
//                     Icon(Icons.add, color: Theme.of(context).iconTheme.color),
//                 onPressed: () {}),
//             body: CustomScrollView(slivers: [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 expandedHeight: 120,
//                 title: Container(
//                     padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                     width: 70,
//                                     margin: EdgeInsets.only(left: 5, right: 20),
//                                     child: Stack(children: [
//                                       FittedBox(
//                                           child: Container(
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(width: 2),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)),
//                                               child: CircleAvatar(
//                                                   backgroundColor:
//                                                       Colors.grey[200],
//                                                   backgroundImage: AssetImage(
//                                                       "lib/Resources/Splash/s.jpg"),
//                                                   minRadius: 17))),
//                                       Positioned(
//                                           left: 30,
//                                           child: Container(
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(width: 2),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)),
//                                               child: FittedBox(
//                                                   child: CircleAvatar(
//                                                       backgroundColor:
//                                                           Colors.grey[200],
//                                                       backgroundImage: AssetImage(
//                                                           "lib/Resources/Profile/dp.jpeg"),
//                                                       minRadius: 15))))
//                                     ])),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.redAccent,
//                                         borderRadius: BorderRadius.circular(8)),
//                                     padding:
//                                         EdgeInsets.fromLTRB(18, 10, 18, 10),
//                                     child: Text("library",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline6
//                                             .copyWith(
//                                                 color: Theme.of(context)
//                                                     .primaryColor,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 15)))
//                               ]),
//                           InkWell(
//                               splashColor: Colors.redAccent,
//                               borderRadius: BorderRadius.circular(50),
//                               onTap: () {},
//                               child: Padding(
//                                   padding: const EdgeInsets.all(8),
//                                   child: Icon(Icons.search_rounded)))
//                         ])),
//                 floating: true,
//                 pinned: true,
//                 bottom: PreferredSize(
//                     preferredSize: Size(double.infinity, 100),
//                     child: TopTabBar(
//                       controller: _pageControl,
//                       tabs: <String>["private", "shared", "public", "saved"],
//                     )),
//               ),
//               SliverFillRemaining(
//                   child: TabBarView(
//                       controller: _tabController,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: [
//                     Private(),
//                     Container(child: Center(child: Text("shared"))),
//                     Container(child: Center(child: Text("public"))),
//                     Container(child: Center(child: Text("saved"))),
//                   ]))
//             ])));
//   }
// }

// class Private extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _ideas = List<Widget>();

//     () {
//       library_ideas
//           .forEach((dynamic key, dynamic value) => _ideas.add(IdeaPost.private(
//               ideaname: key.toString(),
//               username: value["username"] as String,
//               // userdp: value["userdp"] as AssetImage, //! no userdp for private...
//               description: value["description"] as String,
//               tags: value["tags"] as List,
//               date: value["date"] as String,
//               cover: value["cover"] as Map,
//               structure: value["structure"] as List)));
//     }();

//     return StaggeredGridView.countBuilder(
//         padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
//         crossAxisCount: 4,
//         itemCount: _ideas.length,
//         itemBuilder: (BuildContext context, int index) => _ideas[index],
//         staggeredTileBuilder: (int index) => StaggeredTile.fit(2));
//   }
// }

// class Shared extends StatelessWidget {
//   final List<Widget> ideas;

//   const Shared({Key key, this.ideas}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//         padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
//         crossAxisCount: 4,
//         itemCount: ideas.length,
//         itemBuilder: (BuildContext context, int index) => ideas[index],
//         staggeredTileBuilder: (int index) => StaggeredTile.fit(2));
//   }
// }


 // bottom: TabBar(
                //     controller: _tabController,
                //     unselectedLabelColor: Colors.redAccent,
                //     indicatorColor: Colors.transparent,
                //     onTap: (index) => setState(() => _tabIndex = index),
                //     tabs: [
                //       Tab(
                //           child: Container(
                //               decoration: BoxDecoration(
                //                   color: _tabIndex == 0
                //                       ? Colors.redAccent
                //                       : Theme.of(context)
                //                           .scaffoldBackgroundColor,
                //                   borderRadius: BorderRadius.circular(8)),
                //               padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                //               child: Text("private",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headline6
                //                       .copyWith(
                //                           color: _tabIndex == 0
                //                               ? Colors.white
                //                               : Colors.redAccent,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 10)))),
                //       Tab(
                //           child: Container(
                //               decoration: BoxDecoration(
                //                   color: _tabIndex == 1
                //                       ? Colors.redAccent
                //                       : Theme.of(context)
                //                           .scaffoldBackgroundColor,
                //                   borderRadius: BorderRadius.circular(8)),
                //               padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                //               child: Text("shared",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headline6
                //                       .copyWith(
                //                           color: _tabIndex == 1
                //                               ? Colors.white
                //                               : Colors.redAccent,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 10)))),
                //       Tab(
                //           child: Container(
                //               decoration: BoxDecoration(
                //                   color: _tabIndex == 2
                //                       ? Colors.redAccent
                //                       : Theme.of(context)
                //                           .scaffoldBackgroundColor,
                //                   borderRadius: BorderRadius.circular(8)),
                //               padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                //               child: Text("public",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headline6
                //                       .copyWith(
                //                           color: _tabIndex == 2
                //                               ? Colors.white
                //                               : Colors.redAccent,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 10)))),
                //       Tab(
                //           child: Container(
                //               decoration: BoxDecoration(
                //                   color: _tabIndex == 3
                //                       ? Colors.redAccent
                //                       : Theme.of(context)
                //                           .scaffoldBackgroundColor,
                //                   borderRadius: BorderRadius.circular(8)),
                //               padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                //               child: Text("saved",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headline6
                //                       .copyWith(
                //                           color: _tabIndex == 3
                //                               ? Colors.white
                //                               : Colors.redAccent,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 10)))),
                //     ]),