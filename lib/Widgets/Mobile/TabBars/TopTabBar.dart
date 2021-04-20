import 'package:flutter/material.dart';
import 'package:scribbly/Widgets/Web/Responsive.dart';

class TopTabBar extends StatefulWidget {
  final PageController controller;
  final List tabs;
  final bool scrollable;
  final bool animateTransitions;
  final int index;
  final Color theme;
  final bool web;

  TopTabBar(
      {this.web = false,
      this.controller,
      this.tabs,
      this.scrollable = false,
      this.animateTransitions = true,
      this.index,
      this.theme});

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  Map<String, bool> _btns = {};

  Duration pageDuration = Duration(milliseconds: 200);

  Curve pageCurve = Curves.bounceIn;

  int _getIndexOf(String tabValue) {
    int x = 0;
    int index = 0;

    _btns.forEach((key, value) {
      if (key == tabValue) {
        index = x;
      }
      x = x + 1;
    });

    return index;
  }

  void _selectTab(String name) {
    setState(() {
      _btns.forEach((String key, dynamic value) {
        if (key != name) {
          _btns[key] = false;
        }
      });
      _btns[name] = true;
    });

    if (widget.animateTransitions == true) {
      widget.controller.animateToPage(_getIndexOf(name),
          duration: pageDuration, curve: pageCurve);
    } else {
      widget.controller.jumpToPage(_getIndexOf(name));
    }
  }

  @override
  void initState() {
    int x = 0;

    setState(() {
      widget.tabs.forEach((dynamic e) {
        _btns[e.toString()] = x == 0 ? true : false;
        x++;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isResponsive = Responsive.isMedLargeScreen(context);

    List<Widget> _btnsForFixedRow = List<Widget>();

    () {
      double _btn_index = -1;

      _btns.forEach((key, value) {
        _btn_index++;

        return _btnsForFixedRow.add(GestureDetector(
            onTap: () => _selectTab(key),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: _isResponsive
                        ? BorderRadius.horizontal(
                            left: Radius.circular(_btn_index == 0 ? 5 : 0))
                        : BorderRadius.circular(_isResponsive ? 5 : 8),
                    color: _btns[key] == true
                        ? widget.theme
                        : Theme.of(context).scaffoldBackgroundColor),
                height: widget.web ? double.infinity : 32,
                width: 70,
                child: Center(
                    child: Text(key,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: _btns[key] == true
                                ? Colors.white
                                : widget.theme))))));
      });
    }();

    return Container(
        height: 50,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
        //     border: Border.all(width: 2, color: Colors.black)),
        child: widget.web
            ? Container(child: Row(children: _btnsForFixedRow))
            : widget.scrollable
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _btns.length,
                    itemBuilder: (context, index) {
                      String key = _btns.keys.elementAt(index);

                      return GestureDetector(
                          onTap: () => _selectTab(key),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: _btns[key] == true
                                      ? Theme.of(context).buttonColor
                                      : Theme.of(context).accentColor),
                              height: 32,
                              width: 70,
                              child: Center(
                                  child: Text(key,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: _btns[key] == true
                                                  ? Colors.white
                                                  : widget.theme)))));
                    })
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _btnsForFixedRow));
  }
}
