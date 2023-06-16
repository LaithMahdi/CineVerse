import 'package:equatable/equatable.dart';

class MovieCredits extends Equatable {
  final int id;
  final String name;
  final String? profilePath;

  const MovieCredits({
    required this.id,
    required this.name,
    this.profilePath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        profilePath,
      ];
}
