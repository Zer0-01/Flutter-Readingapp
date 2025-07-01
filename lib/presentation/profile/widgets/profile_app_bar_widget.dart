import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProfileAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.chevron_left)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
