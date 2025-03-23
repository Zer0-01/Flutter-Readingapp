import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingapps/extensions.dart';

class ReadingContentWidget extends StatelessWidget {
  final TextEditingController syllableController;

  const ReadingContentWidget({super.key, required this.syllableController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: syllableController,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: context.theme.colorScheme.surface,
        hintText: context.loc.general_please_enter_a_syllable.capitalizeFirst,
        hintStyle: context.textTheme.bodyMedium
            ?.copyWith(color: context.theme.colorScheme.surfaceDim),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.colorScheme.surfaceDim),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.colorScheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
