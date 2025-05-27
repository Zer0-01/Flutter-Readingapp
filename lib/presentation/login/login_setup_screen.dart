import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/data/repository/auth_repository.dart';
import 'package:readingapps/presentation/login/bloc/login_bloc.dart';
import 'package:readingapps/presentation/login/login_screen.dart';

@RoutePage()
class LoginSetupScreen extends StatelessWidget {
  const LoginSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(authRepository: AuthRepository()),
        child: const LoginScreen());
  }
}
