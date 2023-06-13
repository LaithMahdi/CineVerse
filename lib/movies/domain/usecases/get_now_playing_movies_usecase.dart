import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/movies/domain/entities/movie.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUsecase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
