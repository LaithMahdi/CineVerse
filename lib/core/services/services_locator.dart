import 'package:cineverse/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:cineverse/movies/data/datasource/movie_remote_data_source.dart';
import 'package:cineverse/movies/data/repository/movie_repository.dart';
import 'package:cineverse/movies/domain/entities/movie_detail.dart';
import 'package:cineverse/movies/domain/repository/base_movie_repository.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:cineverse/movies/presentation/controller/movie_details_bloc.dart';
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
        ));
    // Use Cases

    // Registering the GetNowPlayingMoviesUsecase use case.
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));

    // Repository

    // Registering the MovieRepository repository with the BaseMovieRepository contract.
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // DATA SOURCE

    // Registering the MovieRemoteDataSource as the implementation of the BaseMovieRemoteDataSource.
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
