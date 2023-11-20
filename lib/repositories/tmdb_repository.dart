import 'package:grekino/models/tmdb_configuration_model.dart';
import 'package:grekino/models/tmdb_results_model.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';
import 'package:grekino/services/api_service.dart';

class TmdbRepository extends ITmdbRepository {
  String? baseImageUrl;
  String? fileSize;

  @override
  Future<String> getImageUrlPrefix() async {
    if (baseImageUrl == null && fileSize == null) {
      TmdbConfiguration configuration =
          (await ApiService().getTmdbConfiguration())!;
      baseImageUrl = configuration.images.secureBaseUrl;
      fileSize = configuration.images.posterSizes.first;
    }
    return "$baseImageUrl$fileSize";
  }

  @override
  Future<MovieResult> getMovieResult(String imdbId) async {
    TmdbResults tmdbResults = (await ApiService().getTmdbMovieResults(imdbId))!;
    return tmdbResults.movieResults[0];
  }
}
