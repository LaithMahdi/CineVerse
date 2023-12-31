import 'package:cineverse/movies/data/models/movie_credits_model.dart';
import 'package:cineverse/movies/data/models/movie_details_model.dart';
import 'package:cineverse/movies/data/models/movie_genres_model.dart';
import 'package:cineverse/movies/data/models/movie_model.dart';
import 'package:cineverse/movies/data/models/movie_person_credits_model.dart';
import 'package:cineverse/movies/data/models/recommendation_model.dart';
import 'package:cineverse/movies/domain/usecases/get%20_movie_credits_person.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopluarMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetail(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameters parameters);

  Future<List<MovieCreditsModel>> getMovieCredits(CreditParameters parameters);

  Future<List<MoviePersonCreditsModel>> getMoviePersonCredits(
      MovieCreditsPersonParameters parameters);

  Future<List<MovieGenresModel>> getMovieGenres();
}
