import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendationEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetMovieCreditsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieCreditsEvent(this.id);
  @override
  List<Object> get props => [id];
}
