import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Cara Menggunakan Aplikasi"),
        content: const Column(
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
            child: const Text("Tutup"),
          ),
        ],
      );
    },
  );
}

@RoutePage()
class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
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
        title: const Text(
          "ISeBa: Mari membaca !",
          style: TextStyle(
            fontSize: 24, // Adjust the font size
            fontWeight: FontWeight.bold, // Apply bold font weight
            color: Colors.white, // Change text color
          ),
        ),
        backgroundColor: const Color(0xFFD5A4A4),
        // Use a pastel color (replace with your desired color)
        elevation: 4,
        actions: [
          IconButton(
              onPressed: () {
                showHelpDialog(context);
              },
              icon: const Icon(Icons.help_outline))
        ], // Add elevation for a shadow effect
      ),
      body: SizedBox(
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
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Perkataan Terhasil:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          formedWord,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 0,
                          children: <Widget>[
                            for (var syllable in syllables)
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      side: const BorderSide(
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
                                    style: const TextStyle(
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
                      decoration: const InputDecoration(
                        labelText: 'Masukkan suku kata',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Seterusnya',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (formedWord.isNotEmpty) {
                        await playWordAudio(formedWord);
                      }
                    },
                    icon: const Icon(
                      Icons.speaker,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Mainkan sebutan perkataan',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      resetFormedWord();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    label: const Text(
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
