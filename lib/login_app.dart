
import 'package:login_cubit_simple/cubit/login_cubit.dart';
import 'package:login_cubit_simple/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
