import 'package:auth/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  //Флаг, от которого зависит, что будет отображаться на экране
   bool _isLoggedIn = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isLoggedIn
            ? const Text('Login Screen Success')
            : const Text('Login Screen Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoggedIn
                ? const Text(
                    'Congratulations, you are login!',
                    style: TextStyle(fontSize: 24),
                  )
                : const Text(
                    'Oops!',
                    style: TextStyle(fontSize: 24),
                  ),
            const SizedBox(height: 20),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  setState(() {
                    _isLoggedIn = true;
                  });
                }
              },
              builder: (context, state) {
                switch (state) {
                  case LoginSuccess _:
                    return Text(
                      'Token is: ${state.token}',
                      style: const TextStyle(fontSize: 24),
                    );
                  case LoginError _:
                    return Text(
                      'Error: ${state.errorMessage}',
                      style: const TextStyle(fontSize: 24),
                    );
                  default:
                    return const Text('Loading...');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
