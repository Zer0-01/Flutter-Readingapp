import 'package:auto_route/auto_route.dart';
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
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            width: context.screenWidth,
            height: context.heightPct(20),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => context.router.pushPath("/reading"),
                child: Container(
                  width: context.widthPct(50),
                  height: context.heightPct(20),
                  color: Colors.blue,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    context.loc.reading,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.router.pushPath("/fonics"),
                child: Container(
                  width: context.widthPct(50),
                  height: context.heightPct(20),
                  color: Colors.red,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    context.loc.fonics,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
