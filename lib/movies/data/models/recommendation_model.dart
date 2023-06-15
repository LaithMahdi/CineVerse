import 'package:cineverse/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json["id"],
        backdropPath:
            json["backdrop_path"] ?? '/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
      );
}
