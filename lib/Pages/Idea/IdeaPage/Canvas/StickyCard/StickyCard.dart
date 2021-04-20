import 'package:flutter/material.dart';

class StickyCard extends StatelessWidget {
  final Map contributor;
  final String blockType;

  bool checked;
  String entry;
  String imageUrl;
  String videoUrl;
  String audioUrl;
  String text;

  String stickyCardType;

  StickyCard.text({Key key, this.text, this.contributor, this.blockType})
      : super(key: key) {
    stickyCardType = "text";
  }

  StickyCard.image({Key key, this.imageUrl, this.contributor, this.blockType})
      : super(key: key) {
    stickyCardType = "image";
  }

  StickyCard.video({Key key, this.videoUrl, this.contributor, this.blockType})
      : super(key: key) {
    stickyCardType = "video";
  }

  StickyCard.audio({Key key, this.audioUrl, this.contributor, this.blockType})
      : super(key: key) {
    stickyCardType = "audio";
  }

  StickyCard.checkbox(
      {Key key, this.entry, this.checked, this.contributor, this.blockType})
      : super(key: key) {
    stickyCardType = "audio";
  }

  @override
  Widget build(BuildContext context) {
    if (stickyCardType == "text") {
      return Container(
          width: double.infinity,
          child: Text(text.toString(),
              textAlign:
                  blockType == "clause" ? TextAlign.start : TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 14, height: 1.5)));
    } else if (stickyCardType == "image") {
      return Container(
          margin: blockType == "clause"
              ? const EdgeInsets.fromLTRB(0, 15, 20, 0)
              : const EdgeInsets.fromLTRB(20, 15, 0, 0),
          height: 45,
          width: 65,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: Theme.of(context).scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(3)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(imageUrl, fit: BoxFit.cover)));
    } else if (stickyCardType == "video") {
      return Container(
          margin: blockType == "clause"
              ? const EdgeInsets.fromLTRB(0, 15, 20, 0)
              : const EdgeInsets.fromLTRB(20, 15, 0, 0),
          height: 45,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(
                  width: 2, color: Theme.of(context).scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28));
    } else if (stickyCardType == "audio") {
      return Container(
          margin: blockType == "clause"
              ? const EdgeInsets.fromLTRB(0, 15, 20, 0)
              : const EdgeInsets.fromLTRB(20, 15, 0, 0),
          height: 45,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                  width: 2, color: Theme.of(context).scaffoldBackgroundColor),
              borderRadius: BorderRadius.circular(5)),
          child: Icon(Icons.audiotrack_rounded, color: Colors.white));
    }

    return Container();
  }
}
