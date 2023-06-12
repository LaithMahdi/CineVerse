import 'package:cineverse/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopluarMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}
