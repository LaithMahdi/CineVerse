import 'package:cineverse/core/network/error_message_model.dart';
import 'package:cineverse/core/utils/app_constance.dart';
import 'package:cineverse/core/error/exceptions.dart';
import 'package:cineverse/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:cineverse/movies/data/models/movie_credits_model.dart';
import 'package:cineverse/movies/data/models/movie_details_model.dart';
import 'package:cineverse/movies/data/models/movie_model.dart';
import 'package:cineverse/movies/data/models/recommendation_model.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_credits_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:cineverse/movies/domain/usecases/get_movie_recommendation_usecase.dart';
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
          (e) => MovieModel.fromJson(e),
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
    final response = await Dio().get(AppConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetail(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(AppConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieCreditsModel>> getMovieCredits(
      CreditParameters parameters) async {
    final response = await Dio().get(AppConstance.creditPath(parameters.id));

    if (response.statusCode == 200) {
      return List<MovieCreditsModel>.from(
        (response.data["cast"] as List)
            .map(
              (e) => MovieCreditsModel.fromJson(e),
            )
            .take(10),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
