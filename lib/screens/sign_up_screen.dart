import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:news_app/bloc/signup_bloc/states/sign_up_states.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (prev, curr) => prev.signUpState != curr.signUpState,
      listener: (context, state) {
        if (state.signUpState is SignUpSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => HomeScreen()),
          );
        }

        if (state.signUpState is SignUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.signUpState.error!)));
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This is Sign Up Screen'),
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
                        SignUp(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    child:
                        state.signUpState is SignUpLoading
                            ? const CircularProgressIndicator()
                            : const Text('Sign Up'),
                  );
                },
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => LoginScreen()),
                  );
                },
                child: Text('Login '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
