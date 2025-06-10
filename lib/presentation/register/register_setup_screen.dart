import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/data/repository/auth_repository.dart';
import 'package:readingapps/presentation/register/bloc/register_bloc.dart';
import 'package:readingapps/presentation/register/register_screen.dart';

@RoutePage()
class RegisterSetupScreen extends StatelessWidget {
  const RegisterSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc(authRepository: AuthRepository()),
        child: const RegisterScreen());
  }
}
