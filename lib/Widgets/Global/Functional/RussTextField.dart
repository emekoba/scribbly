import 'package:flutter/material.dart';

class RussTextField extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final String hintText;
  final TextStyle hintStyle;
  final String type;
  final Function onChange;
  TextEditingController controller;

  RussTextField({
    this.height,
    this.width,
    this.padding,
    this.type,
    this.hintText,
    this.onChange,
    this.hintStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 60,
        width: width ?? double.infinity,
        padding: padding ?? EdgeInsets.only(top: 3, left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).accentColor),
        child: Center(
            child: TextField(
                controller: controller,
                keyboardType:
                    type == "email" ? TextInputType.emailAddress : null,
                enableSuggestions: type == "password" ? false : true,
                autocorrect: type == "password" ? false : true,
                obscureText: type == "password" ? true : false,
                onChanged: (String value) => onChange(value),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 15),
                decoration: InputDecoration(
                    hintText: hintText ?? "",
                    hintStyle: hintStyle ??
                        Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor),
                    border: InputBorder.none))));
  }
}
