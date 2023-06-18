import 'package:cineverse/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:cineverse/movies/data/datasource/movie_remote_data_source.dart';
import 'package:cineverse/movies/data/repository/movie_repository.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:cineverse/movies/domain/usecases/get%20_movie_credits_person.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_genres_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:cineverse/movies/presentation/controller/movie_credit_person_bloc.dart';
import 'package:cineverse/movies/presentation/controller/movie_details_bloc.dart';
import 'package:cineverse/movies/presentation/controller/movie_genre_category_bloc.dart';

import 'package:cineverse/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

/// The service locator for movie-related dependencies.
/// Registers the use cases, repositories, and data sources required for movie operations.
class ServicesLocator {
  /// Initializes the service locator by registering all the required dependencies.
  void init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(
          sl(),
          sl(),
          sl(),
        ));

    sl.registerFactory(() => MovieCreditPersonBloc(sl()));
    sl.registerFactory(() => MovieGenreCategoryBloc(sl()));
    // sl.registerFactory(() => MovieGenresBloc(sl()));
    // Use Cases

    // Registering the GetNowPlayingMoviesUsecase use case.
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieCreditsUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieCreditsPersonUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieGenresUsecase(sl()));

    // Repository

    // Registering the MovieRepository repository with the BaseMovieRepository contract.
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // DATA SOURCE

    // Registering the MovieRemoteDataSource as the implementation of the BaseMovieRemoteDataSource.
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
