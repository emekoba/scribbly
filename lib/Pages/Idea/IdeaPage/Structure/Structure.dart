import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Block/Block.dart';
import 'package:scribbly/Widgets/Global/GlobalFunctions.dart';

class Structure extends StatefulWidget {
  final List structure;
  final bool isCollapsed;
  final Color pageTheme;

  const Structure({this.structure, this.isCollapsed, this.pageTheme});

  @override
  _StructureState createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: Random().nextInt(5000)),
        () => setState(() => _isLoading = false));

    super.initState();
  }

  List<Widget> _generateNewBlocks() {
    List<Widget> blockList = List<Widget>();

    sortStructureOffline(structure: widget.structure).forEach((dynamic block) {
      blockList.add(Block.collapsed(
          pageTheme: widget.pageTheme,
          key: Key(block["paragraphs"].first["value"] as String),
          paragraphs: block["paragraphs"] as List,
          hierarchy: block["hierarchy"] as String,
          contributor: block["contributor"] as Map,
          structure: widget.structure,
          type: block["type"] as String));
    });

    return blockList;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SliverFillRemaining(
            child: Center(
                child: SpinKitChasingDots(size: 70, color: widget.pageTheme)))
        : SliverList(delegate: SliverChildListDelegate(_generateNewBlocks()));
  }
}
