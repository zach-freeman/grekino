
import 'package:flutter/cupertino.dart';
import 'package:flutter_great_movies/repositories/i_tmdb_repository.dart';

import '../locator.dart';

class MovieListItemViewModel extends ChangeNotifier {
  bool _loading = false;
  String _posterImageUrl = "";
  bool get loading => _loading;
  String get posterImageUrl => _posterImageUrl;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setPosterImageUrl(String url) {
    _posterImageUrl = url;
  }

  getPosterImageUrl(String imdbId) async {
    setLoading(true);
    ITmdbRepository tmdbRepository = locator<ITmdbRepository>();
    String posterImageUrl = await tmdbRepository.getPosterImageUrl(imdbId);
    setPosterImageUrl(posterImageUrl);
    setLoading(false);
  }
}