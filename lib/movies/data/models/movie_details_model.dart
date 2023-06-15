import 'package:cineverse/movies/data/models/movie_genres_model.dart';
import 'package:cineverse/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.overview,
    required super.genres,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        genres: List<MovieGenresModel>.from(
            json["genres"].map((e) => MovieGenresModel.fromJson(e))),
        releaseDate: json["release_date"],
        runtime: json["runtime"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
