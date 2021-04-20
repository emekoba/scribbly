import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  String country;
  bool getGrid = false;
  Function onCountrySelected;
  double height;
  double width;
  final bool
      showLabel; //? whether to show showLabel under the flag...in grid or alone
  final Color labelColor;

  Flag(
      {this.country, this.height, this.width, this.showLabel, this.labelColor});

  Flag.grid({this.onCountrySelected, this.showLabel, this.labelColor}) {
    getGrid = true;
  }

  Map<String, AssetImage> allCountries = {
    "Nigeria": AssetImage("lib/Resources/Flags/nigeria.png"),
    "Cameroon": AssetImage("lib/Resources/Flags/cameroon.png"),
    "Chad": AssetImage("lib/Resources/Flags/chad.png"),
    "South Sudan": AssetImage("lib/Resources/Flags/southsudan.png"),
    "Ghana": AssetImage("lib/Resources/Flags/ghana.png"),
    "South Africa": AssetImage("lib/Resources/Flags/southafrica.png"),
    "Tanzania": AssetImage("lib/Resources/Flags/tanzania.png"),
    "Togo": AssetImage("lib/Resources/Flags/togo.png"),
  };

  @override
  Widget build(BuildContext context) {
    return getGrid
        ? FlagGrid(
            allCountries: allCountries, onCountrySelected: onCountrySelected)
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Container(
                    height: height ?? 45,
                    width: width ?? 50,
                    child: Image(
                        image: allCountries[country],
                        fit: BoxFit.cover,
                        width: double.infinity)),
                showLabel == false
                    ? Offstage()
                    : Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(country,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 10,
                                    color: labelColor ??
                                        Theme.of(context).primaryColor)))
              ]);
  }
}

class FlagGrid extends StatefulWidget {
  final Function onCountrySelected;
  final Map allCountries;

  const FlagGrid({this.onCountrySelected, this.allCountries});

  @override
  _FlagGridState createState() => _FlagGridState();
}

class _FlagGridState extends State<FlagGrid> {
  String countrySelected = "Nigeria";

  bool isChosen = true;

  void _selectFlag(String newCountry) {
    setState(() {
      countrySelected = newCountry;
    });

    widget.onCountrySelected(newCountry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 300,
        child: GridView.builder(
            // padding: EdgeInsets.only(left: 20),
            primary: false,
            shrinkWrap: true,
            itemCount: widget.allCountries.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              dynamic key = widget.allCountries.keys.elementAt(index);

              return GestureDetector(
                  onTap: () => _selectFlag(key.toString()),
                  child: Column(children: [
                    Stack(children: [
                      Image(
                          image:
                              widget.allCountries[key.toString()] as AssetImage,
                          fit: BoxFit.cover,
                          width: double.infinity),
                      countrySelected == key.toString()
                          ? Positioned(
                              top: 10,
                              right: 0,
                              child: Material(
                                  elevation: 5,
                                  color: Theme.of(context).buttonColor,
                                  child: Container(
                                      height: 20,
                                      width: 25,
                                      child: Icon(Icons.check, size: 12))))
                          : Offstage()
                    ]),
                    // Text(key.toString(),
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .headline6
                    //         .copyWith(fontSize: 10))
                  ]));
            }));
  }
}
