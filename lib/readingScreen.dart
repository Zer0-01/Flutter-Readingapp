import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ReadingScreen extends StatefulWidget {
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final TextEditingController _syllableController = TextEditingController();
  String formedWord = '';
  FlutterTts flutterTts = FlutterTts();
  List<String> syllables = []; // Store the entered syllables

  Future<void> initTts() async {
    await flutterTts.setLanguage('ms-MY'); // Set the language to Bahasa Melayu
    await flutterTts.setPitch(1.0); // Set pitch (optional)
    await flutterTts.setVolume(1.0); // Set volume (optional)
    await flutterTts.setSpeechRate(0.4); // Set speech rate (optional)
  }

  @override
  void initState() {
    super.initState();
    initTts();
  }

  Future<void> playSyllableAudio(String syllable) async {
    await flutterTts.speak(syllable);
  }

  Future<void> playWordAudio(String word) async {
    await flutterTts.speak(word);
  }

  void resetFormedWord() {
    setState(() {
      formedWord = '';
      _syllableController.clear();
      syllables.clear();
    });
  }

  @override
  void dispose() {
    _syllableController.dispose();
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Formed Word:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              formedWord,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                // Display the entered syllables as smaller buttons
                for (var syllable in syllables)
                  Padding(
                    padding: EdgeInsets.all(0.0), // Reduce padding
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                              side: BorderSide(
                                color: Colors.black,
                                width: 6.0,
                              )) // Adjust button size
                          ),
                      onPressed: () {
                        playSyllableAudio(syllable);
                      },
                      child: Text(syllable),
                    ),
                  ),
                // Text field for entering syllables
              ],
            ),
            Expanded(
              child: TextField(
                controller: _syllableController,
                decoration: InputDecoration(labelText: 'Enter Syllable'),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () async {
                String syllable = _syllableController.text.trim();
                if (syllable.isNotEmpty) {
                  await playSyllableAudio(syllable);
                  setState(() {
                    syllables.add(syllable);
                    formedWord += syllable;
                    _syllableController.clear();
                  });
                }
              },
              child: Text('Next'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (formedWord.isNotEmpty) {
                  await playWordAudio(formedWord);
                }
              },
              child: Text('Play Word'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                resetFormedWord();
              },
              child: Text('Reset Formed Word'),
            ),
          ],
        ),
      ),
    );
  }
}
