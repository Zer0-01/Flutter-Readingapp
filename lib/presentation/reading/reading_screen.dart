import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/presentation/reading/bloc/reading_bloc.dart';
import 'package:readingapps/presentation/reading/widgets/reading_appbar_widget.dart';
import 'package:readingapps/presentation/reading/widgets/reading_content_widget.dart';
import 'package:readingapps/presentation/reading/widgets/reading_footer_widget.dart';
import 'package:readingapps/presentation/reading/widgets/reading_header_widget.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late final TextEditingController syllableController;
  bool isSeterusnyaButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    syllableController = TextEditingController();
    syllableController.addListener(_onSyllableChanged);
  }

  @override
  void dispose() {
    syllableController.dispose();
    super.dispose();
  }

  void _onSyllableChanged() {
    isSeterusnyaButtonEnabled = syllableController.text.isNotEmpty;
    setState(() {});
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
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ReadingHeaderWidget(),
                  ReadingContentWidget(syllableController: syllableController),
                  ReadingFooterWidget(
                    syllableController: syllableController,
                    isSeterusnyaButtonEnabled: isSeterusnyaButtonEnabled,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
