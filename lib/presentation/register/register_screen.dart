import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/presentation/register/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(Icons.chevron_left)),
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.loc.create_an_account,
                style: context.textTheme.headlineLarge
                    ?.copyWith(color: Colors.black),
              ),
              Text(
                context.loc.welcome_please_enter_your_details,
                style: context.textTheme.labelLarge
                    ?.copyWith(color: Colors.black45),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
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
                      ),
                    ),
                    TextFormField(
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
                      ),
                    ),
                    TextFormField(
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
                      ),
                    ),
                    SizedBox(
                        width: context.width,
                        child: FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: Text(context.loc.register))),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
