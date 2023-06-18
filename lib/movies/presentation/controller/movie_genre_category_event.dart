import 'package:equatable/equatable.dart';

abstract class MovieGenreCategoryEvent extends Equatable {
  const MovieGenreCategoryEvent();
}

class GetMovieGenreCategoryEvent extends MovieGenreCategoryEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
