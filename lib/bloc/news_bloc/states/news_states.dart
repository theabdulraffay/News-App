import 'package:equatable/equatable.dart';

class NewsStates extends Equatable {
  final String? error;

  const NewsStates({this.error});

  @override
  List<Object?> get props => [error];
}

class NewsInitialState extends NewsStates {
  const NewsInitialState();
}

class NewsLoadingState extends NewsStates {
  const NewsLoadingState();
}

class NewsSuccessState extends NewsStates {
  const NewsSuccessState();
}

class NewsFailureState extends NewsStates {
  const NewsFailureState({required String error}) : super(error: error);
}
