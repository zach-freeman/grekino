import 'package:flutter_great_movies/models/great_movie_model.dart';

abstract class IGreatMoviesRepository {
  Future<List<GreatMovies>> getMoviesForVolume(int volume);
  Future<GreatMovies> getMovieForId(String id);
  Future<void> updateMovieWatchInfo(
      String id, String dateWatched, double starRating, String review);
  Future<void> updateMovieInfo(String id, String posterImageUrl, String description);
  Future<List<GreatMovies>> searchMovies(String searchTerm);
}
