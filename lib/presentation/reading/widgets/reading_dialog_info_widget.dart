import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:readingapps/extensions.dart';

class ReadingDialogInfoWidget extends StatelessWidget {
  const ReadingDialogInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.dialogTheme.backgroundColor,
      title: Text(context.loc.general_how_to_use.capitalize!,
          style: context.theme.textTheme.titleLarge),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.general_type_the_syllables_in_the_text_field),
          Text(context.loc.general_press_next_to_type_the_next_syllable),
          Text(context.loc
              .general_press_play_word_pronunciation_to_hear_the_pronunciation_of_the_generated_word),
          Text(context
              .loc.general_press_delete_to_delete_the_formed_syllable_or_word),
          Text(context.loc
              .general_press_the_syllable_displayed_on_the_blackboard_to_hear_the_pronunciation_of_that_syllable),
        ],
      ),
      actions: [
        FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup")),
      ],
    );
  }
}
