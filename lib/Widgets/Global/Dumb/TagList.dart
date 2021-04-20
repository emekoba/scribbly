import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';

class TagList extends StatelessWidget {
  final List tags;
  final Color pageTheme;

  const TagList({this.tags, this.pageTheme});

  @override
  Widget build(BuildContext context) {
    List<int> _colors = [
      0xffe6194b,
      // 0xffEEDD82,
      //// 0xfff032e6,
      // 0xfffabebe,
      0xff008080,
      // 0xffe6beff,
      //// 0xff9a6324,
      //// 0xfffffac8,
      //// 0xff800000,
      // 0xffaaffc3,
      // 0xff808000,
      // 0xffffd8b1,
      0xff000075,
      // 0xff808080,
      //// 0xffffffff,
      //// 0xff3cb44b,
      // 0xff000000,
      0xfff58231,
      // 0xff911eb4,
      //// 0xff46f0f0,
      // 0xffffe119,
      // 0xff4363d8,
      // 0xffdd82ee,
      // 0xffbcf60c,
      0xff1A1A1A,
    ];

    return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: Wrap(
            children: tags
                .map((dynamic title) => BoxChip(
                    backgroundColor: pageTheme,
                    // Color(_colors[Random().nextInt(_colors.length)]),
                    label: Text(title.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 10, color: Colors.white))))
                .toList()));
  }
}

class BoxChip extends StatelessWidget {
  final Widget label;
  final Color backgroundColor;

  const BoxChip({Key key, this.label, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        borderRadius:
            BorderRadius.circular(Responsive.isMedLargeScreen(context) ? 5 : 8),
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.only(right: 10, bottom: 10),
            decoration: BoxDecoration(
                color: backgroundColor ??
                    Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(
                    Responsive.isMedLargeScreen(context) ? 5 : 8)),
            child: label));
  }
}
