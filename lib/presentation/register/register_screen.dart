import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:readingapps/extensions.dart';
import 'package:readingapps/functions.dart';
import 'package:readingapps/presentation/common_widgets/app_bar_back_button.dart';
import 'package:readingapps/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:readingapps/presentation/register/bloc/register_bloc.dart';
import 'package:readingapps/presentation/register/widgets/register_success_dialog_widget.dart';

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
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const CupertinoActivityIndicator(
                  color: Colors.white,
                  radius: 16,
                );
              },
            );
          } else if (state.registerStatus == RegisterStatus.success) {
            Navigator.pop(context);
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const RegisterSuccessDialogWidget());
          } else if (state.registerStatus == RegisterStatus.failure) {
            Navigator.pop(context);
            showErrorToast(
                context, state.dioExceptionType, state.dioBadResponseCode);
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
                  AppTextFormFieldWidget(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.loc.please_enter_your_name;
                      }
                      return null;
                    },
                    onTapOutside: (value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    labelText: context.loc.name,
                  ),
                  AppTextFormFieldWidget(
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
                    onTapOutside: (value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    labelText: context.loc.email,
                  ),
                  AppTextFormFieldWidget(
                    controller: _passwordController,
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
                    onTapOutside: (value) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    labelText: context.loc.password,
                    obscureText: state.isObscureText,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          context
                              .read<RegisterBloc>()
                              .add(const OnTapObscureEvent());
                        },
                        child: Icon(state.isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
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
