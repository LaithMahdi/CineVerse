import 'package:cineverse/movies/domain/entities/movie_genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final String overview;
  final List<MovieGenre> genres;
  final String releaseDate;
  final int runtime;
  final double voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.genres,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        title,
        overview,
        genres,
        releaseDate,
        runtime,
        voteAverage,
      ];
}
