import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/usecase/base_usecase.dart';

import 'package:cineverse/movies/domain/entities/movie_person_credits.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieCreditsPersonUsecase extends BaseUseCase<List<MoviePersonCredits>,
    MovieCreditsPersonParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieCreditsPersonUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<MoviePersonCredits>>> call(
      MovieCreditsPersonParameters parameters) async {
    return await baseMovieRepository.getMovieCreditsPerson(parameters);
  }
}

class MovieCreditsPersonParameters extends Equatable {
  final int personId;

  const MovieCreditsPersonParameters({
    required this.personId,
  });

  @override
  // TODO: implement props
  List<Object> get props => [personId];
}
