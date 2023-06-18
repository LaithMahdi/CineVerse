import 'dart:async';

import 'package:cineverse/core/usecase/base_usecase.dart';
import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_genres_usecase.dart';
import 'package:cineverse/movies/presentation/controller/movie_genre_category_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_genre_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGenreCategoryBloc
    extends Bloc<GetMovieGenreCategoryEvent, MovieGenreCategoryState> {
  MovieGenreCategoryBloc(
    this.getMovieGenresUsecase,
  ) : super(const MovieGenreCategoryState()) {
    on<GetMovieGenreCategoryEvent>(_getMovieGenreCategory);
  }
  final GetMovieGenresUsecase getMovieGenresUsecase;

  FutureOr<void> _getMovieGenreCategory(GetMovieGenreCategoryEvent event,
      Emitter<MovieGenreCategoryState> emit) async {
    final result = await getMovieGenresUsecase(const NoParameters());
    result.fold(
        (l) => emit(
              state.copyWith(
                moviGenressState: RequestState.error,
                movieGenresMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieGenres: r,
                moviGenressState: RequestState.loaded,
              ),
            ));
  }
}
