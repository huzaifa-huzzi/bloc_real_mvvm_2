

import 'package:bloc_mvvm_2/models/Movies/movies.dart';

abstract class MoviesRepository{
  Future<MoviesModel> fetchMoviesList();
}