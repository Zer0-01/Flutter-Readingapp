import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/data/models/phonic.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/functions.dart';

class FonicScreen extends StatelessWidget {
  const FonicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Phonic> phonics = [
      Phonic(name: "A", audio: AudioConstants.AUDIO_A),
      Phonic(name: "B", audio: AudioConstants.AUDIO_B),
      Phonic(name: "C", audio: AudioConstants.AUDIO_C),
      Phonic(name: "D", audio: AudioConstants.AUDIO_D),
      Phonic(name: "E", audio: AudioConstants.AUDIO_E),
      Phonic(name: "E'", audio: AudioConstants.AUDIO_E_2),
      Phonic(name: "F", audio: AudioConstants.AUDIO_F),
      Phonic(name: "G", audio: AudioConstants.AUDIO_G),
      Phonic(name: "H", audio: AudioConstants.AUDIO_H),
      Phonic(name: "I", audio: AudioConstants.AUDIO_I),
      Phonic(name: "J", audio: AudioConstants.AUDIO_J),
      Phonic(name: "K", audio: AudioConstants.AUDIO_K),
      Phonic(name: "L", audio: AudioConstants.AUDIO_L),
      Phonic(name: "M", audio: AudioConstants.AUDIO_M),
      Phonic(name: "N", audio: AudioConstants.AUDIO_N),
      Phonic(name: "O", audio: AudioConstants.AUDIO_O),
      Phonic(name: "P", audio: AudioConstants.AUDIO_P),
      Phonic(name: "Q", audio: AudioConstants.AUDIO_Q),
      Phonic(name: "R", audio: AudioConstants.AUDIO_R),
      Phonic(name: "S", audio: AudioConstants.AUDIO_S),
      Phonic(name: "T", audio: AudioConstants.AUDIO_T),
      Phonic(name: "U", audio: AudioConstants.AUDIO_U),
      Phonic(name: "V", audio: AudioConstants.AUDIO_V),
      Phonic(name: "W", audio: AudioConstants.AUDIO_W),
      Phonic(name: "X", audio: AudioConstants.AUDIO_X),
      Phonic(name: "Y", audio: AudioConstants.AUDIO_Y),
      Phonic(name: "Z", audio: AudioConstants.AUDIO_Z),
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
            children: phonics
                .map(
                  (phonic) => GestureDetector(
                    onTap: () {
                      final audioPlayer = AudioPlayer();
                      audioPlayer.play(AssetSource(phonic.audio));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: getRandomColor(type: ColorType.pastel),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        phonic.name,
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
