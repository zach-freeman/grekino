
import 'package:flutter/cupertino.dart';
import 'package:flutter_great_movies/repositories/i_great_movies_repository.dart';
import 'package:flutter_great_movies/repositories/i_tmdb_repository.dart';

import '../locator.dart';
import '../models/great_movie_model.dart';
import '../models/tmdb_results_model.dart';

class MovieListItemViewModel extends ChangeNotifier {
  bool _loading = false;
  String _posterImageUrl = "";
  String _description = "";
  bool get loading => _loading;
  String get posterImageUrl => _posterImageUrl;
  String get description => _description;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setPosterImageUrl(String url) {
    _posterImageUrl = url;
  }

  setDescription(String overview) {
    _description = overview;
  }

  getMovieInfo(String id, String imdbId) async {
    setLoading(true);
    IGreatMoviesRepository greatMoviesRepository = locator<IGreatMoviesRepository>();
    GreatMovies greatMovie = await greatMoviesRepository.getMovieForId(id);
    if (greatMovie.posterImageUrl.isEmpty && greatMovie.description.isEmpty) {
      ITmdbRepository tmdbRepository = locator<ITmdbRepository>();
      MovieResult movieResult = await tmdbRepository.getMovieResult(imdbId);
      String imageUrlPrefix = await tmdbRepository.getImageUrlPrefix();
      String posterImageUrl = imageUrlPrefix + movieResult.posterPath;
      String description = movieResult.overview;
      setPosterImageUrl(posterImageUrl);
      setDescription(description);
      greatMoviesRepository.updateMovieInfo(id, posterImageUrl, description);
    } else {
      setPosterImageUrl(greatMovie.posterImageUrl);
      setDescription(greatMovie.description);
    }
    setLoading(false);
  }
}