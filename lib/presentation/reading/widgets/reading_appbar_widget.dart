import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/reading/bloc/reading_bloc.dart';
import 'package:readingapps/presentation/reading/widgets/reading_bottom_sheet_widget.dart';
import 'package:readingapps/presentation/reading/widgets/reading_dialog_info_widget.dart';

class ReadingAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ReadingAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.loc.general_ISeBa,
          style: Theme.of(context).textTheme.titleLarge),
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      actions: [
        IconButton(
          onPressed: () async {
            final CountryEnum? result = await showModalBottomSheet(
              context: context,
              builder: (context) => ReadingBottomSheetWidget(),
            );

            if (result != null) {
              if (!context.mounted) return;
              context
                  .read<ReadingBloc>()
                  .add(OnSelectLanguageEvent(country: result));
            }
          },
          icon: BlocBuilder<ReadingBloc, ReadingState>(
            builder: (context, state) => CountryFlag.fromLanguageCode(
              state.country.languageCode,
              width: 16,
              shape: const Circle(),
            ),
          ),
        ),
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
