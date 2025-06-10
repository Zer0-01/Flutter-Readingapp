import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:readingapps/configuration/app_router/app_router.gr.dart';
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
                    context.loc.success_exclamation_mark,
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    context.loc.registration_successful,
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              FilledButton(
                  onPressed: () {
                    context.router.replaceAll([const LoginSetupRoute()],
                        updateExistingRoutes: false);
                  },
                  child: Text(context.loc.back_to_login_page))
            ],
          ),
        ),
      ),
    );
  }
}
