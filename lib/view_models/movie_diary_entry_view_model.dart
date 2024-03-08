import 'package:flutter/cupertino.dart';
import 'package:grekino/constants.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';

import '../locator.dart';
import '../models/great_movie_model.dart';
import '../models/tmdb_results_model.dart';
import '../providers/i_great_movies_provider.dart';

class MovieDiaryEntryViewModel extends ChangeNotifier {
  bool _loading = false;
  String _posterImageUrl = "";
  bool get loading => _loading;
  String get posterImageUrl => _posterImageUrl;

  late IGreatMoviesProvider greatMoviesProvider;
  late ITmdbRepository tmdbRepository;

  MovieDiaryEntryViewModel({required this.greatMoviesProvider, required this.tmdbRepository});

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setPosterImageUrl(String url) {
    _posterImageUrl = url;
  }

  getMovieInfo(String? id) async {
    if (id == null) {
      return;
    }
    setLoading(true);
    GreatMovieModel? greatMovie = await greatMoviesProvider.getMovieForId(id);
    if (greatMovie == null) {
      setLoading(false);
      return;
    }
    String posterImageUrl = greatMovie.posterImageUrl ?? await getPosterImageUrl(greatMovie);
    setPosterImageUrl(posterImageUrl);
    setLoading(false);
  }

  Future<String> getPosterImageUrl(GreatMovieModel greatMovie) async {
    MovieResult movieResult = await tmdbRepository.getMovieResult(greatMovie.imdbId!);
    String imageUrlPrefix = await tmdbRepository.getImageUrlPrefix();
    greatMovie.posterImageUrl = imageUrlPrefix + movieResult.posterPath;
    await greatMoviesProvider.updateGreatMovie(greatMovie);
    return imageUrlPrefix + movieResult.posterPath;
  }

  deleteMovieWatchEntry(String? id) async {
    if (id != null) {
      setLoading(true);
      GreatMovieModel? greatMovie = await greatMoviesProvider.getMovieForId(id);
      greatMovie?.dateWatched = Constants.defaultDateWatched;
      greatMovie?.userStarRating = 0.0;
      greatMovie?.userReview = "";
      greatMovie?.isWatched = false;
      await greatMoviesProvider.updateGreatMovie(greatMovie!);
      setLoading(false);
    }
  }
}
