part of 'news_bloc.dart';

class NewsState extends Equatable {
  final NewsStates states;
  final News? news;
  const NewsState({required this.states, required this.news});

  NewsState copyWith({NewsStates? states, News? news}) {
    return NewsState(states: states ?? this.states, news: news ?? this.news);
  }

  @override
  List<Object> get props => [states, news ?? ''];
}

final class NewsInitial extends NewsState {
  NewsInitial() : super(states: NewsInitialState(), news: null);
}
