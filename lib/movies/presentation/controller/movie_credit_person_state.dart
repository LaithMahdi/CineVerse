import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/entities/movie_person_credits.dart';
import 'package:equatable/equatable.dart';

class MovieCreditPersonState extends Equatable {
  final List<MoviePersonCredits> movieCreditPerson;
  final RequestState movieCreditPersonState;
  final String movieCreditPersonMessage;
  const MovieCreditPersonState({
    this.movieCreditPerson = const [],
    this.movieCreditPersonState = RequestState.loading,
    this.movieCreditPersonMessage = '',
  });
  MovieCreditPersonState copyWith({
    List<MoviePersonCredits>? movieCreditPerson,
    RequestState? movieCreditPersonState,
    String? movieCreditPersonMessage,
  }) {
    return MovieCreditPersonState(
      movieCreditPerson: movieCreditPerson ?? this.movieCreditPerson,
      movieCreditPersonMessage:
          movieCreditPersonMessage ?? this.movieCreditPersonMessage,
      movieCreditPersonState:
          movieCreditPersonState ?? this.movieCreditPersonState,
    );
  }

  @override
  List<Object?> get props => [
        movieCreditPerson,
        movieCreditPersonState,
        movieCreditPersonMessage,
      ];
}
