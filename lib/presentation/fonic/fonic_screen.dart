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
      body: Wrap(
          children: fonicList
              .map((fonic) => Container(
                    margin: const EdgeInsets.all(4),
                    width: context.widthPct(10),
                    height: context.heightPct(10),
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(fonic),
                  ))
              .toList()),
    );
  }
}
