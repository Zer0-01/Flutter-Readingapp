import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/reading/bloc/reading_bloc.dart';

class ReadingFooterWidget extends StatelessWidget {
  final TextEditingController syllableController;
  final bool isSeterusnyaButtonEnabled;

  const ReadingFooterWidget(
      {super.key,
      required this.syllableController,
      required this.isSeterusnyaButtonEnabled});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) => Column(
        children: [
          FilledButton.icon(
            onPressed: isSeterusnyaButtonEnabled
                ? () {
                    context.read<ReadingBloc>().add(OnPressedSeterusnyaEvent(
                        syllable: syllableController.text));
                    syllableController.clear();
                  }
                : null,
            label: Text(context.loc.general_next),
            icon: const Icon(Icons.chevron_right),
            iconAlignment: IconAlignment.end,
          ),
          FilledButton.icon(
            onPressed: state.syllables.isNotEmpty
                ? () {
                    context
                        .read<ReadingBloc>()
                        .add(const OnPressedMainkanPerkataanEvent());
                  }
                : null,
            label: const Text("Mainkan sebutan perkataan"),
            icon: const Icon(Icons.speaker),
            iconAlignment: IconAlignment.end,
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: context.theme.colorScheme.error,
              foregroundColor: context.theme.colorScheme.onError,
            ),
            onPressed: state.syllables.isNotEmpty
                ? () {
                    context
                        .read<ReadingBloc>()
                        .add(const OnPressedPadamEvent());
                  }
                : null,
            label: const Text("Padam"),
            icon: const Icon(Icons.delete),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
