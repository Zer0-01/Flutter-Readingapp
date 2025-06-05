import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onPressed;
  final String title;

  const AppBarBackButton({super.key, this.onPressed, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.chevron_left),
      ),
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
