import 'package:equatable/equatable.dart';

abstract class MovieCreditPersonEvent extends Equatable {
  const MovieCreditPersonEvent();
}

class GetMovieCreditPersonEvent extends MovieCreditPersonEvent {
  final int id;

  const GetMovieCreditPersonEvent(this.id);
  @override
  List<Object> get props => [id];
}
