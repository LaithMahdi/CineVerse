import 'package:cineverse/movies/domain/entities/movie_person_credits.dart';

class MoviePersonCreditsModel extends MoviePersonCredits {
  const MoviePersonCreditsModel({
    required super.id,
    required super.overview,
    required super.title,
    required super.voteAverage,
    super.backdropPath,
    super.releaseDate,
  });

  factory MoviePersonCreditsModel.fromJson(Map<String, dynamic> json) =>
      MoviePersonCreditsModel(
        id: json["id"],
        overview: json["overview"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"] ?? '2000-01-01',
      );
}
