import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc/states/login_states.dart';
import 'package:news_app/bloc/bloc/states/sign_up_states.dart';
import 'package:news_app/services/firebase_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUp>(signupevent);
    on<Login>(loginEvent);
    on<SignOut>(signoutEvent);
  }

  void signoutEvent(SignOut event, Emitter<SignUpState> emit) async {
    await FirebaseService.signOut();
    emit(SignUpInitialState());
  }

  void loginEvent(Login event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(loginState: LoginLoading()));

    try {
      await FirebaseService.signInWithEmailAndPassword(
        event.email,
        event.password,
      );

      emit(state.copyWith(loginState: LoginSuccess()));
    } catch (e) {
      emit(state.copyWith(loginState: LoginFailure(error: e.toString())));
    }
  }

  void signupevent(SignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(signUpState: SignUpLoading()));

    try {
      await FirebaseService.signUpWithEmailAndPassword(
        event.email,
        event.password,
      );

      emit(state.copyWith(signUpState: SignUpSuccess()));
    } catch (e) {
      emit(state.copyWith(signUpState: SignUpFailure(error: e.toString())));
    }
  }
}
