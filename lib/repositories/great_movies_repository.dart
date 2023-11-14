import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/repositories/i_great_movies_repository.dart';

class GreatMoviesRepository extends IGreatMoviesRepository {
  final GreatMovieDatabase _greatMovieDatabase;
  GreatMoviesRepository(this._greatMovieDatabase);

  @override
  Future<List<GreatMovies>> getMoviesForVolume(int volume) {
    return _greatMovieDatabase.moviesForVolume(volume);
  }

  @override
  Future<void> updateMovie(
      String id, String dateWatched, double starRating, String review) {
    return _greatMovieDatabase.updateMovie(id, dateWatched, starRating, review);
  }
}
