import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:readingapps/configuration/app_router/app_router.gr.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc, LoginState>(
            listenWhen: (previous, current) =>
                previous.loginStatus != current.loginStatus,
            listener: (context, state) {
              if (state.loginStatus == LoginStatus.loading) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return LottieBuilder.asset(
                        AnimationConstants.ANIMATION_LOADING);
                  },
                );
                return;
              }
              if (state.loginStatus == LoginStatus.success) {
                Navigator.pop(context);
                context.router.replaceAll([const HomeSetupRoute()]);
                return;
              }

              if (state.loginStatus == LoginStatus.error) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(context.loc.login_failed_please_try_again)));
                return;
              }
            },
            builder: (context, state) {
              return Column(
                spacing: 16,
                children: [
                  Icon(
                    Icons.flutter_dash,
                    size: context.heightPct(20),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: context.loc.email,
                        enabledBorder: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder()),
                  ),
                  TextFormField(
                    obscureText: !state.isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: context.loc.password,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              context
                                  .read<LoginBloc>()
                                  .add(const OnPressedEyeIconEvent());
                            },
                            child: Icon(state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        enabledBorder: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder()),
                  ),
                  FilledButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                          const OnPressedLoginButtonEvent(
                              email: "test", password: "meow"));
                    },
                    child: Text(context.loc.login),
                  ),
                  RichText(
                      text: TextSpan(
                          text: context.loc.dont_have_an_account,
                          style: const TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: " ${context.loc.register}",
                            style: TextStyle(color: context.theme.primaryColor))
                      ]))
                ],
              );
            }),
      ),
    );
  }
}
