import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/presentation/reading/bloc/reading_bloc.dart';
import 'package:readingapps/presentation/reading/reading_screen.dart';

@RoutePage()
class ReadingSetupScreen extends StatelessWidget {
  const ReadingSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReadingBloc(),
      child: const ReadingScreen(),
    );
  }
}
