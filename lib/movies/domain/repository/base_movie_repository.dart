import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/movies/domain/entities/movie.dart';
import 'package:cineverse/movies/domain/entities/movie_detail.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);
}
