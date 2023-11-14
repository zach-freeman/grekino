

abstract class ITmdbRepository {
  Future<String> getImageUrlPrefix();
  Future<String> getPosterImageUrl(String imdbId);
}
