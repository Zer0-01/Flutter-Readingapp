import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<LoginBloc, LoginState>(
            listenWhen: (previous, current) =>
                previous.loginStatus != current.loginStatus,
            listener: (context, state) {
              if (state.loginStatus == LoginStatus.loading) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: LottieBuilder.asset(
                          AnimationConstants.ANIMATION_LOADING),
                    );
                  },
                );
                return;
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Icon(
                    Icons.flutter_dash,
                    size: context.heightPct(20),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    obscureText: !state.isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: GestureDetector(
                            onTap: () {
                              context
                                  .read<LoginBloc>()
                                  .add(const OnPressedEyeIconEvent());
                            },
                            child: Icon(state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                  FilledButton(
                    onPressed: () {
                      context
                          .read<LoginBloc>()
                          .add(const OnPressedLoginButtonEvent());
                    },
                    child: const Text("Login"),
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: "Register",
                            style: TextStyle(color: context.theme.primaryColor))
                      ]))
                ],
              );
            }),
      ),
    );
  }
}
