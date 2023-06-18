import 'package:equatable/equatable.dart';

class MoviePersonCredits extends Equatable {
  final int id;
  final String overview;
  final String title;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;

  const MoviePersonCredits({
    required this.id,
    required this.overview,
    required this.title,
    this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        overview,
        title,
        backdropPath,
        voteAverage,
        releaseDate,
      ];
}
