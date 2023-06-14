import 'dart:async';
import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/presentation/controller/movie_details_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
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
}
