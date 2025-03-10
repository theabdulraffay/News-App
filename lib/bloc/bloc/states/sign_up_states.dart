import 'package:equatable/equatable.dart';

class SignUpStates extends Equatable {
  final String? error;

  const SignUpStates({this.error});

  @override
  List<Object?> get props => [error];
}

class SignUpInitial extends SignUpStates {
  const SignUpInitial();
}

class SignUpLoading extends SignUpStates {
  const SignUpLoading();
}

class SignUpSuccess extends SignUpStates {
  const SignUpSuccess();
}

class SignUpFailure extends SignUpStates {
  const SignUpFailure({required String error}) : super(error: error);
}
