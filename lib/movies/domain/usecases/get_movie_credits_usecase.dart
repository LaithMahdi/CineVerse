import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/usecase/base_usecase.dart';
import 'package:cineverse/movies/domain/entities/movie_credits.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieCreditsUsecase
    extends BaseUseCase<List<MovieCredits>, CreditParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieCreditsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<MovieCredits>>> call(
      CreditParameters parameters) async {
    return await baseMovieRepository.getMovieCredits(parameters);
  }
}

class CreditParameters extends Equatable {
  final int id;

  const CreditParameters(this.id);

  @override
  List<Object?> get props => [id];
}
