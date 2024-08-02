import 'package:bloc_mvvm_2/Data/Network/NetworkServicesApi.dart';
import 'package:bloc_mvvm_2/Repository/movies/movies_repository.dart';
import 'package:bloc_mvvm_2/config/app_url.dart';
import 'package:bloc_mvvm_2/models/Movies/movies.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  final api = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchMoviesList()async {
    final response = await api.getApi(AppUrl.popularMoviesList);
    return MoviesModel.fromJson(response);
  }
  
  
  
  
  
}