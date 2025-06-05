import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/common_widgets/app_bar_back_button.dart';
import 'package:readingapps/presentation/register/bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButton(
        title: context.loc.create_an_account,
        onPressed: () => context.router.pop(),
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listenWhen: (previous, current) =>
            previous.registerStatus != current.registerStatus,
        listener: (context, state) {
          if (state.registerStatus == RegisterStatus.loading) {
            showDialog(
              context: context,
              builder: (context) {
                return const CupertinoActivityIndicator();
              },
            );
          } else if (state.registerStatus == RegisterStatus.success) {
            Navigator.pop(context);
          } else if (state.registerStatus == RegisterStatus.failure) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.loc.please_enter_your_name;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: context.loc.name,
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(),
                      focusedErrorBorder: const OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.loc.please_enter_your_email;
                      }

                      if (!value.isEmail) {
                        return context.loc.please_enter_a_valid_email;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: context.loc.email,
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(),
                      focusedErrorBorder: const OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: state.isObscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.loc.please_enter_your_password;
                      }

                      if (value.isNumericOnly || value.isAlphabetOnly) {
                        return context.loc.password_must_be_alphanumeric;
                      }

                      if (value.length < 6) {
                        return context
                            .loc.password_must_be_at_least_6_characters;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: context.loc.password,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            context
                                .read<RegisterBloc>()
                                .add(const OnTapObscureEvent());
                          },
                          child: Icon(state.isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(),
                      focusedErrorBorder: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                      width: context.width,
                      child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<RegisterBloc>().add(
                                  OnPressedRegisterEvent(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text));
                            }
                          },
                          child: Text(context.loc.register))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
