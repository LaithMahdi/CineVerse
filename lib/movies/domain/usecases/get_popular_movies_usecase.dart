import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/usecase/base_usecase.dart';
import 'package:cineverse/movies/domain/entities/movie.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUsecase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
