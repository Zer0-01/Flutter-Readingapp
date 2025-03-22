import 'package:flutter/material.dart';
import 'package:readingapps/presentation/reading/widgets/reading_dialog_info_widget.dart';

class ReadingAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ReadingAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("ISeBa: Mari membaca !",
          style: Theme.of(context).textTheme.titleLarge),
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      actions: [
        IconButton(
            onPressed: () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const ReadingDialogInfoWidget(),
                ),
            icon: const Icon(Icons.help_outline))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
