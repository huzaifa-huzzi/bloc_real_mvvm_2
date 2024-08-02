import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm_2/Data/Network/api_response.dart';
import 'package:bloc_mvvm_2/Repository/movies/movies_repository.dart';
import 'package:bloc_mvvm_2/models/Movies/movies.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(_moviesFetched);
  }

  Future<void> _moviesFetched(MoviesFetched event,Emitter<MoviesState>emit) async{
      await moviesRepository.fetchMoviesList().then((value){
          emit(state.copyWith(moviesList: ApiResponse.completed(value)));
      }).onError((error,stackTrace){
          emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
      });
  }

}
