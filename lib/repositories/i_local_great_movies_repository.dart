
import '../models/great_movie_model.dart';

abstract class ILocalGreatMoviesRepository {
  Future<void> insertAll(Stream<List<GreatMovieModel>> greatMovies);
  Future<void> insertMoviesForVolume(int volume, Stream<List<GreatMovieModel>> greatMovies);
  Future<GreatMovieModel?> getMovieForId(String id);
  Future<GreatMovieModel?> getMovieForImdbId(String id);
  Stream<List<GreatMovieModel>> getMoviesForVolume(int volume);
  Future<List<GreatMovieModel>> searchMovies(String searchTerm);
  Future<void> updateGreatMovie(GreatMovieModel greatMovie);
}