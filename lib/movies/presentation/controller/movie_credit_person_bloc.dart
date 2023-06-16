import 'dart:async';

import 'package:cineverse/core/utils/enums.dart';
import 'package:cineverse/movies/domain/usecases/get%20_movie_credits_person.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_event.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCreditPersonBloc
    extends Bloc<MovieCreditPersonEvent, MovieCreditPersonState> {
  MovieCreditPersonBloc(
    this.getMovieCreditsPersonUsecase,
  ) : super(const MovieCreditPersonState()) {
    on<GetMovieCreditPersonEvent>(_getMovieCreditsPerson);
  }
  final GetMovieCreditsPersonUsecase getMovieCreditsPersonUsecase;

  FutureOr<void> _getMovieCreditsPerson(GetMovieCreditPersonEvent event,
      Emitter<MovieCreditPersonState> emit) async {
    final result = await getMovieCreditsPersonUsecase(
        MovieCreditsPersonParameters(personId: event.id));
    result.fold(
        (l) => emit(
              state.copyWith(
                movieCreditPersonState: RequestState.error,
                movieCreditPersonMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                movieCreditPerson: r,
                movieCreditPersonState: RequestState.loaded,
              ),
            ));
  }
}
