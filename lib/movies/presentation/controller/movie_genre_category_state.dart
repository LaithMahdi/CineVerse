import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/entities/movie_genres.dart';
import 'package:equatable/equatable.dart';

class MovieGenreCategoryState extends Equatable {
  const MovieGenreCategoryState({
    this.movieGenres = const [],
    this.moviGenressState = RequestState.loading,
    this.movieGenresMessage = '',
  });

  final List<MovieGenre> movieGenres;
  final RequestState moviGenressState;
  final String movieGenresMessage;

  MovieGenreCategoryState copyWith({
    List<MovieGenre>? movieGenres,
    RequestState? moviGenressState,
    String? movieGenresMessage,
  }) {
    return MovieGenreCategoryState(
      movieGenres: movieGenres ?? this.movieGenres,
      moviGenressState: moviGenressState ?? this.moviGenressState,
      movieGenresMessage: movieGenresMessage ?? this.movieGenresMessage,
    );
  }

  @override
  List<Object> get props => [
        movieGenres,
        moviGenressState,
        movieGenresMessage,
      ];
}
