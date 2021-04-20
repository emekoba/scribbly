import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Block/Collapsed/Block.Collapsed.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Block/Expanded/Block.Expanded.dart';

class Block extends StatelessWidget {
  final List paragraphs;
  final String hierarchy;
  final Map contributor;
  final Color pageTheme;
  final List structure;
  final String type;

  String blockState;

  Block.collapsed(
      {Key key,
      this.paragraphs,
      this.hierarchy,
      this.contributor,
      this.structure,
      this.type,
      this.pageTheme})
      : super(key: key) {
    blockState = "collapsed";
  }

  Block.expanded(
      {Key key,
      this.paragraphs,
      this.hierarchy,
      this.contributor,
      this.structure,
      this.type,
      this.pageTheme})
      : super(key: key) {
    blockState = "expanded";
  }

  @override
  Widget build(BuildContext context) {
    return blockState == "collapsed"
        ? CollpasedBlock(
            pageTheme: pageTheme,
            key: key,
            paragraphs: paragraphs,
            hierarchy: hierarchy,
            contributor: contributor,
            structure: structure,
            type: type,
          )
        : ExpandedBlock(
            pageTheme: pageTheme,
            key: key,
            paragraphs: paragraphs,
            hierarchy: hierarchy,
            contributor: contributor,
            structure: structure,
            type: type,
          );
  }
}
