import 'package:flutter/material.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Paragraph/Card/Paragraph.Plain.dart';
import 'package:scribbly/Pages/Idea/IdeaPage/Paragraph/Plain/Paragraph.Card.dart';

class Paragraph extends StatelessWidget {
  final Map contributor;
  final String blockType;
  final String value;

  String paragraphType;

  Paragraph.plain({Key key, this.contributor, this.blockType, this.value})
      : super(key: key) {
    paragraphType = "plain";
  }

  Paragraph.card({Key key, this.contributor, this.blockType, this.value})
      : super(key: key) {
    paragraphType = "card";
  }

  @override
  Widget build(BuildContext context) {
    return paragraphType == "plain" ? PlainParagraph() : CardParagraph();
  }
}
