import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/usecase/base_usecase.dart';
import 'package:cineverse/movies/domain/entities/movie_genres.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieGenresUsecase
    extends BaseUseCase<List<MovieGenre>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieGenresUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<MovieGenre>>> call(
      NoParameters parameters) async {
    // TODO: implement call
    return await baseMovieRepository.getMovieGenres();
  }
}
