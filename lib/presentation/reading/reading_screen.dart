import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/presentation/reading/bloc/reading_bloc.dart';
import 'package:readingapps/presentation/reading/widgets/reading_appbar_widget.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final TextEditingController _syllableController = TextEditingController();
  late final TextEditingController _newSyllableController;

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

    _newSyllableController = TextEditingController();
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
    _newSyllableController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) => Scaffold(
        appBar: const ReadingAppbarWidget(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.BACKGROUND_IMAGE),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade700,
                      border: Border(
                        top: BorderSide(color: Colors.brown, width: 4),
                        left: BorderSide(color: Colors.brown, width: 4),
                        right: BorderSide(color: Colors.brown, width: 4),
                        bottom: BorderSide(color: Colors.brown, width: 12),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat("EEEE").format(DateTime.now()),
                              style: context.textTheme.bodySmall?.copyWith(
                                  color: context.theme.colorScheme.onPrimary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      context.theme.colorScheme.onPrimary),
                            ),
                            Text(
                              DateFormat("dd/MM/yyyy").format(DateTime.now()),
                              style: context.textTheme.bodySmall?.copyWith(
                                  color: context.theme.colorScheme.onPrimary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      context.theme.colorScheme.onPrimary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: state.syllables.isNotEmpty
                              ? state.syllables
                                  .map(
                                    (syllable) => Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: context
                                            .theme.colorScheme.primaryContainer,
                                        border: Border.all(
                                          color: context
                                              .theme.colorScheme.surfaceDim,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(syllable),
                                    ),
                                  )
                                  .toList()
                              : [
                                  Text(
                                    "Sila masukkan suku kata",
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                            color: context
                                                .theme.colorScheme.onPrimary),
                                  ),
                                ],
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                            width: 24,
                            height: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  TextField(
                    controller: _newSyllableController,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: context.theme.colorScheme.surface,
                      hintText: "Masukkan suku kata",
                      hintStyle: context.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.surfaceDim),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.colorScheme.surfaceDim),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.colorScheme.primary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      context.read<ReadingBloc>().add(OnPressedSeterusnyaEvent(
                          syllable: _newSyllableController.text));
                      _newSyllableController.clear();
                    },
                    label: const Text("Seterusnya"),
                    icon: const Icon(Icons.chevron_right),
                    iconAlignment: IconAlignment.end,
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    label: const Text("Mainkan sebutan perkataan"),
                    icon: const Icon(Icons.speaker),
                    iconAlignment: IconAlignment.end,
                  ),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.error,
                      foregroundColor: context.theme.colorScheme.onError,
                    ),
                    onPressed: () {},
                    label: const Text("Padam"),
                    icon: const Icon(Icons.delete),
                    iconAlignment: IconAlignment.end,
                  ),
                ],
              ),
            ),
          ),
        ),

        // body: SizedBox(
        //   height: double.infinity,
        //   child: Stack(children: [
        //     Positioned.fill(
        //       child: Image.asset(
        //         'assets/images/dood-background.jpg',
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Center(
        //       child: SingleChildScrollView(
        //         child: Column(
        //           children: <Widget>[
        //             Container(
        //               decoration: BoxDecoration(
        //                 color: Colors.green.shade900,
        //                 border: Border.all(
        //                   color: Colors.yellow.shade300, // Border color
        //                   width: 5.0, // Border width
        //                 ),
        //                 borderRadius: BorderRadius.circular(
        //                     10.0), // Adjust the radius as needed
        //               ),
        //               padding: const EdgeInsets.all(10.0),
        //               margin: const EdgeInsets.all(10),
        //               child: Column(
        //                 children: [
        //                   const SizedBox(height: 20),
        //                   const Text(
        //                     'Perkataan Terhasil:',
        //                     style: TextStyle(
        //                       fontSize: 20,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                   Text(
        //                     formedWord,
        //                     style: const TextStyle(
        //                       fontSize: 24,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                   const SizedBox(height: 20),
        //                   Wrap(
        //                     spacing: 0,
        //                     children: <Widget>[
        //                       for (var syllable in syllables)
        //                         Padding(
        //                           padding: const EdgeInsets.all(0.0),
        //                           child: ElevatedButton(
        //                             style: ElevatedButton.styleFrom(
        //                               padding: const EdgeInsets.symmetric(
        //                                   horizontal: 10, vertical: 6),
        //                               shape: RoundedRectangleBorder(
        //                                 borderRadius: BorderRadius.circular(0),
        //                                 side: const BorderSide(
        //                                   color: Colors.blue,
        //                                   width: 6.0,
        //                                 ),
        //                               ),
        //                             ),
        //                             onPressed: () {
        //                               playSyllableAudio(syllable);
        //                             },
        //                             child: Text(
        //                               syllable,
        //                               style: const TextStyle(
        //                                 color: Colors.black,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: 0, horizontal: 80.0),
        //               child: TextField(
        //                 controller: _syllableController,
        //                 decoration: InputDecoration(
        //                   filled: true,
        //                   fillColor: Theme.of(context).colorScheme.surface,
        //                   enabledBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                         color: Theme.of(context).colorScheme.shadow),
        //                     borderRadius:
        //                         const BorderRadius.all(Radius.circular(10.0)),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                         color: Theme.of(context).colorScheme.shadow),
        //                     borderRadius:
        //                         const BorderRadius.all(Radius.circular(10.0)),
        //                   ),
        //                   hintText: 'Masukkan suku kata',
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(height: 10),
        //             ElevatedButton.icon(
        //               onPressed: () async {
        //                 String syllable = _syllableController.text.trim();
        //                 if (syllable.isNotEmpty) {
        //                   await playSyllableAudio(syllable);
        //                   setState(() {
        //                     syllables.add(syllable);
        //                     formedWord += syllable;
        //                     _syllableController.clear();
        //                   });
        //                 }
        //               },
        //               icon: const Icon(
        //                 Icons.arrow_forward,
        //                 color: Colors.white,
        //               ),
        //               label: const Text(
        //                 'Seterusnya',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: Theme.of(context).colorScheme.primary,
        //               ),
        //             ),
        //             const SizedBox(height: 10),
        //             ElevatedButton.icon(
        //               onPressed: () async {
        //                 if (formedWord.isNotEmpty) {
        //                   await playWordAudio(formedWord);
        //                 }
        //               },
        //               icon: const Icon(
        //                 Icons.speaker,
        //                 color: Colors.white,
        //               ),
        //               label: const Text(
        //                 'Mainkan sebutan perkataan',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: Theme.of(context).colorScheme.primary,
        //               ),
        //             ),
        //             const SizedBox(height: 10),
        //             ElevatedButton.icon(
        //               onPressed: () {
        //                 resetFormedWord();
        //               },
        //               icon: const Icon(
        //                 Icons.delete,
        //                 color: Colors.white,
        //               ),
        //               label: const Text(
        //                 'Padam',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: Theme.of(context).colorScheme.primary,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ]),
        // ),
      ),
    );
  }
}
