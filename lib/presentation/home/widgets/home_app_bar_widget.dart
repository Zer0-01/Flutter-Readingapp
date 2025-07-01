import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:readingapps/extensions.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 8,
        children: [
          GestureDetector(
              onTap: () {
                context.router.pushPath("/profile");
              },
              child: const CircleAvatar()),
          Text(
            context.loc.home,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
