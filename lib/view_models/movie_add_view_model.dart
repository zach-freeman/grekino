import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/great_movie_model.dart';
import '../providers/i_great_movies_provider.dart';

class MovieAddViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  late IGreatMoviesProvider greatMoviesProvider;

  MovieAddViewModel({required this.greatMoviesProvider});

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  updateMovie(GreatMovieModel greatMovie, DateTime dateTime, double rating,
      String review) async {
    setLoading(true);
    greatMovie.dateWatched = DateFormat('yyyy-MM-dd').format(dateTime);
    greatMovie.userStarRating = rating;
    greatMovie.userReview = review;
    greatMovie.isWatched = true;
    await greatMoviesProvider.updateGreatMovie(greatMovie);
    setLoading(false);
  }
}
