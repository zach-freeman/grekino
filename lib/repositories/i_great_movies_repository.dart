import 'package:flutter_great_movies/models/great_movie_model.dart';

abstract class IGreatMoviesRepository {
  Future<List<GreatMovies>> getMoviesForVolume(int volume);
  Future<void> updateMovie(
      String id, String dateWatched, double starRating, String review);
}
