import 'package:flutter/material.dart';
import 'package:readingapps/extensions.dart';

class FonicScreen extends StatelessWidget {
  const FonicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fonicList = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.fonics),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: fonicList
                .map(
                  (fonic) => Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text(fonic),
                  ),
                )
                .toList(),
          ),
        ));
  }
}
