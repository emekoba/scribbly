import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Center(
              child: Icon(Icons.error_outline_rounded,
                  color: Colors.red, size: 50))),
      Expanded(
          child: Column(children: [
        Text("Hey Russ!",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 40, color: Theme.of(context).buttonColor)),
        SizedBox(height: 50),
        Text(message,
            style:
                Theme.of(context).textTheme.headline6.copyWith(fontSize: 20)),
      ]))
    ]));
  }
}
