import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/functions.dart';

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
      "E'",
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
                  (fonic) => GestureDetector(
                    onTap: () {
                      final audioPlayer = AudioPlayer();
                      audioPlayer.play(AssetSource('audios/audio_a.mp3'));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: getRandomColor(type: ColorType.pastel),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        fonic,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ));
  }
}
