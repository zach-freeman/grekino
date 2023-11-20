import 'package:grekino/models/tmdb_results_model.dart';

abstract class ITmdbRepository {
  Future<String> getImageUrlPrefix();
  Future<MovieResult> getMovieResult(String imdbId);
}
