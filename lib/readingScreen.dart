import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Cara Menggunakan Aplikasi"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("1. Taipkan suku kata di ruang teks."),
            Text(
                "2. Tekan 'Seterusnya' untuk menaipkan suku kata yang seterusnya."),
            Text(
                "3. Tekan 'Mainkan sebutan perkataan' untuk mendengar sebutan perkataan yang dihasilkan."),
            Text(
                "4. Tekan 'Padam' untuk memadam suku kata atau perkataan yang dibentuk."),
            Text(
                "5. Tekan suku kata yang dipaparkan di papan hitam untuk mendengar sebutan suku kata tersebut."),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Tutup"),
          ),
        ],
      );
    },
  );
}

class ReadingScreen extends StatefulWidget {
  @override
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
        title: Text(
          "ISeBa: Mari membaca !",
          style: TextStyle(
            fontSize: 24, // Adjust the font size
            fontWeight: FontWeight.bold, // Apply bold font weight
            color: Colors.white, // Change text color
          ),
        ),
        backgroundColor: Color(0xFFD5A4A4),
        // Use a pastel color (replace with your desired color)
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () {
                showHelpDialog(context);
              },
              icon: Icon(Icons.help_outline))
        ], // Add elevation for a shadow effect
      ),
      body: Container(
        height: double.infinity,
        child: Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/dood-background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      border: Border.all(
                        color: Colors.yellow.shade300, // Border color
                        width: 5.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Perkataan Terhasil:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          formedWord,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Wrap(
                          spacing: 0,
                          children: <Widget>[
                            for (var syllable in syllables)
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: BorderSide(
                                        color: Colors.blue,
                                        width: 6.0,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    playSyllableAudio(syllable);
                                  },
                                  child: Text(
                                    syllable,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 80.0),
                    child: TextField(
                      controller: _syllableController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan suku kata',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
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
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Seterusnya',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (formedWord.isNotEmpty) {
                        await playWordAudio(formedWord);
                      }
                    },
                    icon: Icon(
                      Icons.speaker,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Mainkan sebutan perkataan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      resetFormedWord();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Padam',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
