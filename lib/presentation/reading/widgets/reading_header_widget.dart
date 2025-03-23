import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readingapps/presentation/reading/bloc/reading_bloc.dart';

class ReadingHeaderWidget extends StatelessWidget {
  const ReadingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green.shade700,
          border: const Border(
            top: BorderSide(color: Colors.brown, width: 4),
            left: BorderSide(color: Colors.brown, width: 4),
            right: BorderSide(color: Colors.brown, width: 4),
            bottom: BorderSide(color: Colors.brown, width: 12),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat("EEEE").format(DateTime.now()),
                  style: context.textTheme.bodySmall?.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      decoration: TextDecoration.underline,
                      decorationColor: context.theme.colorScheme.onPrimary),
                ),
                Text(
                  DateFormat("dd/MM/yyyy").format(DateTime.now()),
                  style: context.textTheme.bodySmall?.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      decoration: TextDecoration.underline,
                      decorationColor: context.theme.colorScheme.onPrimary),
                ),
              ],
            ),
            Row(
              children: state.syllables.isNotEmpty
                  ? state.syllables
                      .map(
                        (syllable) => GestureDetector(
                          onTap: () => context
                              .read<ReadingBloc>()
                              .add(OnPressedSyllableEvent(syllable: syllable)),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: context.theme.colorScheme.primaryContainer,
                              border: Border.all(
                                color: context.theme.colorScheme.surfaceDim,
                                width: 2,
                              ),
                            ),
                            child: Text(syllable),
                          ),
                        ),
                      )
                      .toList()
                  : [
                      Text(
                        "Sila masukkan suku kata",
                        style: context.textTheme.bodyLarge?.copyWith(
                            color: context.theme.colorScheme.onPrimary),
                      ),
                    ],
            ),
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
    );
  }
}
