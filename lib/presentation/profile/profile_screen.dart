import 'package:flutter/material.dart';
import 'package:readingapps/presentation/profile/widgets/profile_app_bar_widget.dart';
import 'package:readingapps/presentation/profile/widgets/profile_picture_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePictureWidget(),
        ],
      ),
    );
  }
}
