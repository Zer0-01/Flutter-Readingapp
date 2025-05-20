import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
                onPressed: () {},
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
