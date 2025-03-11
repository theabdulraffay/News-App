import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:news_app/bloc/signup_bloc/states/login_states.dart';
import 'package:news_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (prev, curr) => prev.loginState != curr.loginState,
      listener: (context, state) {
        if (state.loginState is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => HomeScreen()),
          );
        }

        if (state.loginState is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.loginState.error!)));
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is Login Screen'),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<SignUpBloc>(context).add(
                        Login(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child:
                        state.loginState is LoginLoading
                            ? const CircularProgressIndicator()
                            : const Text('Sign Up'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
