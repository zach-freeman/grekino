import 'package:flutter/cupertino.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';

import '../locator.dart';
import '../models/great_movie_model.dart';
import '../models/tmdb_results_model.dart';
import '../providers/i_great_movies_provider.dart';
import '../repositories/i_firestore_great_movies_repository.dart';

class MovieListItemViewModel extends ChangeNotifier {
  bool _loading = false;
  String _posterImageUrl = "";
  String _description = "";
  bool get loading => _loading;
  String get posterImageUrl => _posterImageUrl;
  String get description => _description;

  late IGreatMoviesProvider greatMoviesProvider;

  MovieListItemViewModel({required this.greatMoviesProvider});

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

  getMovieInfo(String? id, String? imdbId) async {
    if (id == null) {
      return;
    }
    setLoading(true);
    GreatMovieModel? greatMovie = await greatMoviesProvider.getMovieForId(id);
    if (greatMovie == null) {
      setLoading(false);
      return;
    }
    if (greatMovie.posterImageUrl!.isEmpty && greatMovie.description!.isEmpty) {
      ITmdbRepository tmdbRepository = locator<ITmdbRepository>();
      MovieResult movieResult = await tmdbRepository.getMovieResult(imdbId!);
      String imageUrlPrefix = await tmdbRepository.getImageUrlPrefix();
      greatMovie.posterImageUrl = imageUrlPrefix + movieResult.posterPath;
      greatMovie.description = movieResult.overview;
      setPosterImageUrl(imageUrlPrefix + movieResult.posterPath);
      setDescription(movieResult.overview);
      await greatMoviesProvider.updateGreatMovie(greatMovie);
    } else {
      setPosterImageUrl(greatMovie.posterImageUrl ?? '');
      setDescription(greatMovie.description ?? '');
    }
    setLoading(false);
  }
}
