import 'package:cineverse/core/network/error_message_model.dart';
import 'package:cineverse/core/utils/app_constance.dart';
import 'package:cineverse/error/exceptions.dart';
import 'package:cineverse/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:cineverse/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    // Fetch now playing movies from the server
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      // Convert the response data into a list of MovieModel objects
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJsom(e),
        ),
      );
    } else {
      // Handle server errors by throwing a ServerException with the error message
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopluarMovies() async {
    // Fetch popular movies from the server
    final response = await Dio().get(AppConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      // Convert the response data into a list of MovieModel objects
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJsom(e),
        ),
      );
    } else {
      // Handle server errors by throwing a ServerException with the error message
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    // Fetch top rated movies from the server
    final response = await Dio().get(AppConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      // Convert the response data into a list of MovieModel objects
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJsom(e),
        ),
      );
    } else {
      // Handle server errors by throwing a ServerException with the error message
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
