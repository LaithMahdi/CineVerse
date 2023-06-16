import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/movies/domain/entities/movie.dart';
import 'package:cineverse/movies/domain/entities/movie_credits.dart';
import 'package:cineverse/movies/domain/entities/movie_detail.dart';
import 'package:cineverse/movies/domain/entities/movie_person_credits.dart';
import 'package:cineverse/movies/domain/entities/recommendation.dart';
import 'package:cineverse/movies/domain/usecases/get%20_movie_credits_person.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameters parameters);

  Future<Either<Failure, List<MovieCredits>>> getMovieCredits(
      CreditParameters parameters);

  Future<Either<Failure, List<MoviePersonCredits>>> getMovieCreditsPerson(
      MovieCreditsPersonParameters parameters);
}
