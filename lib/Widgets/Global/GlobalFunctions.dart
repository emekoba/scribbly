import 'package:flutter/material.dart';

// class NestedNavigator extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigationKey;
//   final String initialRoute;
//   final Map<String, WidgetBuilder> routes;

//   NestedNavigator({
//     @required this.navigationKey,
//     @required this.initialRoute,
//     @required this.routes,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         child: Navigator(
//             key: navigationKey,
//             initialRoute: initialRoute,
//             onGenerateRoute: (RouteSettings routeSettings) {
//               WidgetBuilder builder = routes[routeSettings.name];
//               if (routeSettings.isInitialRoute) {
//                 return PageRouteBuilder(
//                     pageBuilder: (context, __, ___) => builder(context),
//                     settings: routeSettings);
//               } else {
//                 return MaterialPageRoute(
//                     builder: builder, settings: routeSettings);
//               }
//             }),
//         onWillPop: () {
//           if (navigationKey.currentState.canPop()) {
//             navigationKey.currentState.pop();
//             return Future<bool>.value(false);
//           }
//           return Future<bool>.value(true);
//         });
//   }
// }

String toCamelCase(String value) {
  return value;
}

String concatenateLargeNumber(int value) {
  String _shortenedValue;

  if (value.toString().length > 3) {
    _shortenedValue =
        value.toString().substring(0, value.toString().length - 3);

    return _shortenedValue + "k";
  } else {
    return value.toString();
  }
}

List sortStructureOffline({List structure}) {
  void _getHierarchyOf(String who) {
    // dynamic omega;
    // dynamic pops;
    // dynamic krane = getParentOf(who);

    // if (krane === "genesis") {
    // 	omega = 0;
    // } else {
    // 	pops = _(krane, "string");

    // 	if (pops.hierarchy === "") {
    // 		if (pops.parent === "genesis") {
    // 			omega = 1;
    // 		} else {
    // 			omega = recursiveHierarchy(pops.paragraphs[0].value) + 1;
    // 		}
    // 	}
    // }

    // function recursiveHierarchy(pop) {
    // 	dynamic daemos;

    // 	if (_(pop, "string").hierarchy === "") {
    // 		dynamic poppa = _(getParentOf(pop), "string");

    // 		if (poppa.parent === "genesis") {
    // 			daemos = 1;
    // 		} else {
    // 			daemos = recursiveHierarchy(poppa.paragraphs[0].value) + 1;
    // 		}
    // 	}

    // 	return daemos;
    // }

    // return omega;
  }

  String _getParentOf(String args) {
    String parent = "";

    structure.forEach((dynamic block) {
      if (args == block["paragraphs"].first["value"]) {
        parent = block["parent"] as String;
      }
    });

    return parent;
  }

  bool _isEmpty(List args) {
    return args.isEmpty;
  }

  List _getChildrenOf(String parentCalling) {
    List childNameArr = List<String>();

    structure.forEach((dynamic block) {
      if (parentCalling == block["parent"]) {
        childNameArr.add(block["paragraphs"].first["value"]);
      }
    });

    return childNameArr;
  }

  dynamic _getObjectOf(dynamic value) {
    dynamic obj;

    if (value is List) {
      obj = <dynamic>[];

      value.forEach((dynamic eachval) {
        structure.forEach((dynamic block) {
          if (eachval == block["paragraphs"].first["value"]) {
            obj.add(block);
          }
        });
      });
    }

    if (value is String) {
      structure.forEach((dynamic block) {
        if (value == block["paragraphs"].first["value"]) {
          obj = block;
        }
      });
    }

    return obj;
  }

  bool _isAParent(String who) {
    if (_isEmpty(_getChildrenOf(who))) {
      return false;
    } else {
      return true;
    }
  }

  List _sort(List unsorted) {
    List _gamma = <dynamic>[];
    List _revisedGamma = <dynamic>[];

    void _runEpsilon(String parent) {
      List x = _getChildrenOf(parent);

      x.forEach((dynamic each) {
        _gamma.add(each);

        if (_isAParent(each.toString())) {
          _runEpsilon(each.toString());
        }
      });
    }

    unsorted.forEach((dynamic block) {
      String p = block["paragraphs"].first["value"] as String;

      _gamma.add(p);

      if (_isAParent(p)) {
        _runEpsilon(p);
      }
    });

    _revisedGamma = _gamma.toSet().toList();

    return _getObjectOf(_revisedGamma) as List;
  }

  return _sort(structure);
}
//? this should be moved to ideaBloc as it is not a true global function.....


