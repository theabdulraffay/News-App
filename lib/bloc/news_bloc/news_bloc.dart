import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/bloc/news_bloc/states/news_states.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
