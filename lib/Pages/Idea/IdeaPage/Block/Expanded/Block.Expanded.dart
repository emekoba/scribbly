import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Paragraph/Plain/Paragraph.Card.dart';

class ExpandedBlock extends StatelessWidget {
  final List paragraphs;
  final String hierarchy;
  final Map contributor;
  final Color pageTheme;
  final List structure;
  final String type;

  const ExpandedBlock(
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
    List<CardParagraph> _cards = [];

    return Scaffold(body: PageView(children: _cards));
  }
}
