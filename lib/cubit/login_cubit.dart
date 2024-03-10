import 'package:auth/datasources/login_data_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginDataSource loginDataSource = LoginDataSource();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    emit(LoginLoading());
    try {
      await loginDataSource.login(emailController.text, passwordController.text);
      emit(LoginSuccess(loginDataSource.token.toString()));
    } catch (error) {
      emit(LoginError(error.toString()));
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
