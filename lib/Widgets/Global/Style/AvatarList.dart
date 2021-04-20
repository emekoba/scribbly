import 'package:flutter/material.dart';

class AvatarList extends StatelessWidget {
  final int number;
  final double size;
  final Color borderColor;
  final double spacingSecond;
  final double spacingThird;
  final double borderWidth;

  const AvatarList(
      {this.number,
      @required this.size,
      this.borderColor,
      this.spacingSecond,
      this.spacingThird,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 70),
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: borderWidth ?? 2,
                      color: borderColor ?? Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(13)),
              child: FittedBox(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                          AssetImage("lib/Resources/Profile/dp.jpeg"),
                      minRadius: size))),
          Positioned(
              left: spacingSecond ?? 14,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: borderWidth ?? 2,
                          color: borderColor ?? Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(13)),
                  child: FittedBox(
                      child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage:
                              AssetImage("lib/Resources/Profile/Profile2.jpg"),
                          minRadius: size)))),
          number == 3
              ? Positioned(
                  left: spacingThird ?? 28,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: borderWidth ?? 2,
                              color: borderColor ??
                                  Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(13)),
                      child: FittedBox(
                          child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: AssetImage(
                                  "lib/Resources/Profile/Profile3.jpg"),
                              minRadius: size))))
              : Offstage()
        ]));
  }
}
