part of 'news_bloc.dart';

class NewsState extends Equatable {
  final NewsStates states;
  const NewsState({required this.states});

  NewsState copyWith({NewsStates? states}) {
    return NewsState(states: states ?? this.states);
  }

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {
  NewsInitial() : super(states: NewsInitialState());
}
