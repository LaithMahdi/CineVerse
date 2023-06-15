import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/entities/movie_detail.dart';
import 'package:cineverse/movies/domain/entities/recommendation.dart';
import 'package:equatable/equatable.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = "",
    this.movieRecommendations = const [],
    this.movieRecommendationsMessage = "",
    this.movieRecommendationsState = RequestState.loading,
  });

  final List<Recommendation> movieRecommendations;
  final RequestState movieRecommendationsState;
  final String movieRecommendationsMessage;

  final MovieDetail? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? movieRecommendations,
    RequestState? movieRecommendationsState,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsState:
          movieRecommendationsState ?? this.movieRecommendationsState,
      movieRecommendationsMessage:
          movieDetailsMessage ?? this.movieRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecommendations,
        movieRecommendationsState,
        movieRecommendationsMessage,
      ];
}
