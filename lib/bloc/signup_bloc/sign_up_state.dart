part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final SignUpStates signUpState;
  final LoginStates loginState;

  const SignUpState({required this.signUpState, required this.loginState});

  SignUpState copyWith({SignUpStates? signUpState, LoginStates? loginState}) {
    return SignUpState(
      signUpState: signUpState ?? this.signUpState,
      loginState: loginState ?? this.loginState,
    );
  }

  @override
  List<Object?> get props => [signUpState, loginState];
}

final class SignUpInitialState extends SignUpState {
  SignUpInitialState()
    : super(signUpState: SignUpInitial(), loginState: LoginInitial());
}
