// ignore_for_file: camel_case_types

import 'package:auth/cubit/login_cubit.dart';
import 'package:auth/screens/success_screen.dart';
import 'package:auth/screens/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailTextFormField(),
              SizedBox(height: 20),
              _passTextFormField(),
              SizedBox(height: 20),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _loginButton extends StatelessWidget {
  const _loginButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<LoginCubit>().login();

          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => const SuccessScreen(),
            ),
          );
        },
        child: const Text('LogIn'));
  }
}

class _passTextFormField extends StatelessWidget {
  const _passTextFormField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: context.read<LoginCubit>().passwordController,
      obscureText: true,
      decoration: inputDecoration('Password'),
    );
  }
}

class _emailTextFormField extends StatelessWidget {
  const _emailTextFormField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: context.read<LoginCubit>().emailController,
      validator: _validEmail,
      decoration: inputDecoration('Email'),
    );
  }

  String? _validEmail(value) =>
      value == null || value.isEmpty ? 'Please enter your Email!' : null;
}
