import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc/states/news_states.dart';
import 'package:news_app/data/response.dart';
import 'package:news_app/models/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsEvent>(_fetchnewsevent);
  }

  void _fetchnewsevent(FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(state.copyWith(states: NewsLoadingState()));

    try {
      final news = await Response.getNews();
      emit(state.copyWith(states: NewsSuccessState(), news: news));
    } catch (e) {
      emit(state.copyWith(states: NewsFailureState(error: e.toString())));
    }
  }
}
