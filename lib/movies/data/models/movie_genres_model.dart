import 'package:cineverse/movies/domain/entities/movie_genres.dart';

class MovieGenresModel extends MovieGenre {
  const MovieGenresModel({
    required super.id,
    required super.name,
  });

  factory MovieGenresModel.fromJson(Map<String, dynamic> json) =>
      MovieGenresModel(
        id: json["id"],
        name: json["name"],
      );
}
