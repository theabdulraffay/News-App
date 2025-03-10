import 'package:equatable/equatable.dart';

class LoginStates extends Equatable {
  final String? error;

  const LoginStates({this.error});

  @override
  List<Object?> get props => [error];
}

class LoginInitial extends LoginStates {
  const LoginInitial();
}

class LoginLoading extends LoginStates {
  const LoginLoading();
}

class LoginSuccess extends LoginStates {
  const LoginSuccess();
}

class LoginFailure extends LoginStates {
  const LoginFailure({required String error}) : super(error: error);
}
