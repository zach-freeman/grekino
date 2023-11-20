import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/i_great_movies_repository.dart';

class GreatMoviesRepository extends IGreatMoviesRepository {
  final GreatMovieDatabase _greatMovieDatabase;
  GreatMoviesRepository(this._greatMovieDatabase);

  @override
  Future<List<GreatMovies>> getMoviesForVolume(int volume) {
    return _greatMovieDatabase.moviesForVolume(volume);
  }

  @override
  Future<GreatMovies> getMovieForId(String id) {
    return _greatMovieDatabase.movieForId(id);
  }

  @override
  Future<void> updateMovieWatchInfo(
      String id, String dateWatched, double starRating, String review) {
    return _greatMovieDatabase.updateMovieWatchInfo(
        id, dateWatched, starRating, review);
  }

  @override
  Future<void> updateMovieInfo(
      String id, String posterImageUrl, String description) {
    return _greatMovieDatabase.updateMovieInfo(id, posterImageUrl, description);
  }

  @override
  Future<List<GreatMovies>> searchMovies(String searchTerm) {
    return _greatMovieDatabase.searchMovies(searchTerm);
  }
}
