import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/home/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const OnInitHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          context.loc.home,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                ImageConstants.IMAGE_BANNER,
                width: context.width,
              ),
            ),
            SizedBox(
              height: context.heightPct(20),
              child: Row(
                spacing: 8,
                children: [
                  GestureDetector(
                    onTap: () => context.router.pushPath("/reading"),
                    child: Column(
                      spacing: 4,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.blue.shade100,
                              child: Image.asset(
                                ImageConstants.IMAGE_READING,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Text(context.loc.reading)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.pushPath("/fonics"),
                    child: Column(
                      spacing: 4,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.red.shade100,
                              child: Image.asset(
                                ImageConstants.IMAGE_PHONIC,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Text(context.loc.fonics)),
                      ],
                    ),
                  ),
                  Column(
                    spacing: 4,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.grey.shade200,
                            child: Image.asset(
                              ImageConstants.IMAGE_COMING_SOON,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Text(context.loc.coming_soon)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
