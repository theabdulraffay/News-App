part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {}

class SignUp extends SignUpEvent {
  final String email;
  final String password;

  SignUp({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class Login extends SignUpEvent {
  final String email;
  final String password;

  Login({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignOut extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
