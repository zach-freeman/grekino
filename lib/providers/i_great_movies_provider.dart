
import '../models/great_movie_model.dart';

abstract class IGreatMoviesProvider {
  Future<GreatMovieModel?> getMovieForId(String id);
  Future<GreatMovieModel?> getMovieForImdbId(String imdbId);
  Stream<List<GreatMovieModel>> getMoviesForVolume(int volume);
  Future<List<GreatMovieModel>> searchMovies(String searchTerm);
  Future<void> updateGreatMovie(GreatMovieModel? greatMovie);
}