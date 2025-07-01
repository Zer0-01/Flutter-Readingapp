import 'package:flutter/widgets.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Name"),
        Text("Email"),
      ],
    );
  }
}
