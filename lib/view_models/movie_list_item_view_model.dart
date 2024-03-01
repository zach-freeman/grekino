import 'package:flutter/cupertino.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';

import '../locator.dart';
import '../models/firestore_great_movie_model.dart';
import '../models/great_movie_model.dart';
import '../models/tmdb_results_model.dart';
import '../repositories/i_firestore_great_movies_repository.dart';

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

  getMovieInfo(String? id, String? imdbId) async {
    if (id == null) {
      return;
    }
    setLoading(true);
    IFirestoreGreatMoviesRepository fsGreatMoviesRepo = locator<IFirestoreGreatMoviesRepository>();
    GreatMovieModel? greatMovie = await fsGreatMoviesRepo.getMovieForId(id);
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
      await fsGreatMoviesRepo.updateGreatMovie(greatMovie);
    } else {
      setPosterImageUrl(greatMovie.posterImageUrl ?? '');
      setDescription(greatMovie.description ?? '');
    }
    setLoading(false);
  }
}
