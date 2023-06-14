import 'package:cineverse/core/error/failure.dart';
import 'package:cineverse/core/usecase/base_usecase.dart';
import 'package:cineverse/movies/domain/entities/movie_detail.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailsUsecase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
