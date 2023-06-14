import 'package:cineverse/movies/data/models/movie_details_model.dart';
import 'package:cineverse/movies/data/models/movie_model.dart';
import 'package:cineverse/movies/data/models/recommendation_model.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopluarMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetail(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameters parameters);
}
