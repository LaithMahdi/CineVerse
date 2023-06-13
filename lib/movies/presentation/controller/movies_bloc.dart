import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:cineverse/movies/presentation/controller/movies_event.dart';
import 'package:cineverse/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedUsecase getTopRatedUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getTopRatedUsecase,
    this.getPopularMoviesUsecase,
  ) : super(const MoviesState()) {
    // Event Handlers

    on<GetNowPlayingEvent>((event, emit) async {
      // Execute the use case to get the now playing movies.
      final result = await getNowPlayingMoviesUsecase.execute();

      // Emit a state indicating that the movies are loaded.
      // emit(const MoviesState(nowPlayingState: RequestState.loaded));

      // Handle the result of the use case execution.
      result.fold(
        // If an error occurred, emit an error state with the error message.
        (l) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
        // If the use case executed successfully, emit a state with the loaded movies.
        (r) => emit(state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        )),
      );
    });

    on<GetPopluarMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUsecase.execute();
      result.fold(
        // If an error occurred, emit an error state with the error message.
        (l) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          ),
        ),
        // If the use case executed successfully, emit a state with the loaded movies.
        (r) => emit(
          state.copyWith(
            popularMovies: r,
            popularState: RequestState.loaded,
          ),
        ),
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedUsecase.execute();
      result.fold(
        // If an error occurred, emit an error state with the error message.
        (l) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          ),
        ),
        // If the use case executed successfully, emit a state with the loaded movies.
        (r) => emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
