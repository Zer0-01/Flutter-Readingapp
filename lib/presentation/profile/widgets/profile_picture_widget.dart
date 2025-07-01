import 'package:flutter/material.dart';
import 'package:readingapps/extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.widthPct(20),
          height: context.widthPct(20),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
        ),
        Text(BoneMock.title)
      ],
    );
  }
}
