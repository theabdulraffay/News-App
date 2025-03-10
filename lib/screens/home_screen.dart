import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc/sign_up_bloc.dart';
import 'package:news_app/screens/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpInitialState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => SignUpScreen()),
          );
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('This is Home Screen')),
            TextButton(
              onPressed: () {
                BlocProvider.of<SignUpBloc>(context).add(SignOut());
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
