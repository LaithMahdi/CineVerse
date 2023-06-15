import 'dart:async';
import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:cineverse/movies/presentation/controller/movie_details_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      this.getMovieDetailsUsecase, this.getMovieRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendations);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieRecommendationUsecase getMovieRecommendationUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(
              state.copyWith(
                movieDetailsState: RequestState.error,
                movieDetailsMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieDetails: r,
                movieDetailsState: RequestState.loaded,
              ),
            ));
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieRecommendationUsecase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(
              state.copyWith(
                movieRecommendationsState: RequestState.error,
                movieRecommendationsMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieRecommendations: r,
                movieRecommendationsState: RequestState.loaded,
              ),
            ));
  }
}
