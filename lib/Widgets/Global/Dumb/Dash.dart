import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const Dash({Key key, this.width, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 10,
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20)),
      // child: LinearProgressIndicator(
      //     value: null,
      //     valueColor:
      //         AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
      //     backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
