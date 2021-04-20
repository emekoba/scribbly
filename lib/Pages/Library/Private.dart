import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribbly/Pages/Idea/IdeaPost.dart';
import 'package:scribbly/Resources/Resources.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';

class Private extends StatefulWidget {
  final Color pageTheme;
  final ScrollController scrollController;

  const Private({this.pageTheme, this.scrollController});

  @override
  _PrivateState createState() => _PrivateState();
}

class _PrivateState extends State<Private>
    with AutomaticKeepAliveClientMixin<Private> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<Widget> _ideas = List<Widget>();

    bool _responsive = false;
    // Responsive.isMedLargeScreen(context);
    //

    () {
      library_ideas
          .forEach((dynamic key, dynamic value) => _ideas.add(IdeaPost.private(
              pageTheme: widget.pageTheme,
              ideaname: key.toString(),
              username: value["username"] as String,
              // userdp: value["userdp"] as AssetImage, //! no userdp for private...
              description: value["description"] as String,
              tags: value["tags"] as List,
              date: value["date"] as String,
              cover: value["cover"] as Map,
              structure: value["structure"] as List)));
    }();

    return StaggeredGridView.countBuilder(
        controller: widget.scrollController,
        padding: EdgeInsets.fromLTRB(
            5, _responsive ? 80 : 5, _responsive ? 14 : 5, 20),
        crossAxisCount: 4,
        itemCount: _ideas.length,
        itemBuilder: (BuildContext context, int index) => _ideas[index],
        staggeredTileBuilder: (int index) =>
            StaggeredTile.fit(Responsive.isMedLargeScreen(context) ? 1 : 2));
  }

  @override
  bool get wantKeepAlive => true;
}
