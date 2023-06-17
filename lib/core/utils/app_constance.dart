class AppConstance {
  // Base URL for the movie API
  static const String baseUrl = "https://api.themoviedb.org/3";

  // API key for authentication
  static const String apiKey = "f8336b21cff6c673592cf2915264f620";

  // Endpoint for fetching now playing movies
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  // Endpoint for fetching popular movies
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  // Endpoint for fetching top rated movies
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  // Endpoint for fetching top rated movies
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  // Endpoint for fetching top rated movies
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  // Endpoint for fetching top rated movies
  static String creditPath(int movieId) =>
      "$baseUrl/movie/$movieId/credits?api_key=$apiKey";

  // Endpoint for fetching top rated movies
  static String creditPersonPath(int personId) =>
      "$baseUrl/person/$personId/movie_credits?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";

  static const String imageNotFound =
      "https://aeroclub-issoire.fr/wp-content/uploads/2020/05/image-not-found.jpg";
}
