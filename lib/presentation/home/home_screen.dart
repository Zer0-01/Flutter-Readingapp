import 'package:flutter/material.dart';
import 'package:readingapps/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            width: context.screenWidth,
            height: context.heightPct(20),
          ),
        ],
      ),
    );
  }
}
