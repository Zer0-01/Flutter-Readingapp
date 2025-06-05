import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:readingapps/extensions.dart';

class RegisterSuccessDialogWidget extends StatelessWidget {
  const RegisterSuccessDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: context.heightPct(10),
                    color: Colors.green.shade600,
                  ),
                  Text(
                    "Success",
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Registration successful! Welcome aboard. You can now log in and start exploring.",
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back to Login Page"))
            ],
          ),
        ),
      ),
    );
  }
}
