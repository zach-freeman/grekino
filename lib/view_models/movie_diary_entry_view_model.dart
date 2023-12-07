import 'package:flutter/cupertino.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';

import '../locator.dart';
import '../models/firestore_great_movie_model.dart';
import '../models/tmdb_results_model.dart';
import '../repositories/i_firestore_great_movies_repository.dart';

class MovieDiaryEntryViewModel extends ChangeNotifier {
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

  getMovieInfo(String? id, String? imdbId) async {
    if (id == null) {
      return;
    }
    setLoading(true);
    IFirestoreGreatMoviesRepository fsGreatMoviesRepo = locator<IFirestoreGreatMoviesRepository>();
    FirestoreGreatMovie? greatMovie = await fsGreatMoviesRepo.getMovieForId(id);
    if (greatMovie == null) {
      setLoading(false);
      return;
    }
    if (greatMovie.posterImageUrl.isEmpty) {
      ITmdbRepository tmdbRepository = locator<ITmdbRepository>();
      MovieResult movieResult = await tmdbRepository.getMovieResult(imdbId!);
      String imageUrlPrefix = await tmdbRepository.getImageUrlPrefix();
      greatMovie.posterImageUrl = imageUrlPrefix + movieResult.posterPath;
      setPosterImageUrl(greatMovie.posterImageUrl);
      await fsGreatMoviesRepo.updateGreatMovie(greatMovie);
    } else {
      setPosterImageUrl(greatMovie.posterImageUrl);
    }
    setLoading(false);
  }
}
