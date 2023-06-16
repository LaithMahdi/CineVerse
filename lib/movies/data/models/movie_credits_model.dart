import 'package:cineverse/movies/domain/entities/movie_credits.dart';

class MovieCreditsModel extends MovieCredits {
  const MovieCreditsModel({
    required super.id,
    required super.name,
    super.profilePath,
  });
  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      MovieCreditsModel(
        id: json["id"],
        name: json["name"],
        profilePath: json["profile_path"] ?? "/7rwSXluNWZAluYMOEWBxkPmckES.jpg",
      );
}
