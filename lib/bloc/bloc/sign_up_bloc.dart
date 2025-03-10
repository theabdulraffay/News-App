import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc/states/login_states.dart';
import 'package:news_app/bloc/bloc/states/sign_up_states.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>(signupevent);
  }

  void signupevent(SignUpEvent event, Emitter<SignUpState> emit) {
    add(event);
  }
}
