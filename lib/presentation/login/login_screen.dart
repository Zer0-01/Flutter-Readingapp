import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:readingapps/configuration/app_router/app_router.gr.dart';
import 'package:readingapps/constants.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:readingapps/presentation/login/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.loginStatus != current.loginStatus,
          listener: (context, state) {
            if (state.loginStatus == LoginStatus.loading) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const CupertinoActivityIndicator(
                    color: Colors.white,
                    radius: 16,
                  );
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
                SizedBox(
                  height: context.heightPct(30),
                  child: SvgPicture.asset(
                    VectorConstants.VECTOR_BACKGROUND,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      AppTextFormFieldWidget(
                        controller: _emailController,
                        labelText: context.loc.email,
                        onTapOutside: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      AppTextFormFieldWidget(
                        controller: _passwordController,
                        obscureText: !state.isPasswordVisible,
                        onTapOutside: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            context
                                .read<LoginBloc>()
                                .add(const OnPressedEyeIconEvent());
                          },
                          child: Icon(state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: context.loc.password,
                      ),
                      FilledButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                              OnPressedLoginButtonEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text));
                        },
                        child: Text(
                          context.loc.login,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.pushPath("/register");
                        },
                        child: RichText(
                          text: TextSpan(
                            text: context.loc.dont_have_an_account,
                            style: context.textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: " ${context.loc.register}",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
