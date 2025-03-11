import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/bloc/news_bloc/states/news_states.dart';
import 'package:news_app/bloc/signup_bloc/sign_up_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state.states is NewsLoadingState ||
              state.states is NewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state.states is NewsSuccessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('This is Home Screen')),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.news!.articles!.length,
                    itemBuilder: (context, index) {
                      final article = state.news!.articles![index];
                      return ListTile(
                        title: Text(article.title ?? ' '),
                        subtitle: Text(article.description ?? ' '),
                      );
                    },
                  ),
                ),

                TextButton(
                  onPressed: () {
                    BlocProvider.of<SignUpBloc>(context).add(SignOut());
                    // context.read<SignUpBloc>().add(SignOut());
                  },
                  child: Text('Logout'),
                ),
              ],
            );
          } else {
            return Center(child: Text('Failed to load news'));
          }
        },
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return BlocListener<SignUpBloc, SignUpState>(
//     listener: (context, state) {
//       if (state is SignUpInitialState) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (builder) => SignUpScreen()),
//         );
//       }
//     },
//     child: Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Text('This is Home Screen')),
//           TextButton(
//             onPressed: () {
//               BlocProvider.of<SignUpBloc>(context).add(SignOut());
//               // context.read<SignUpBloc>().add(SignOut());
//             },
//             child: Text('Logout'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
