import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  MoviesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetNowPlayingEvent extends MoviesEvent {}

class GetPopluarMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}
