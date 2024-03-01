import 'package:flutter/cupertino.dart';
import '../locator.dart';
import 'package:intl/intl.dart';

import '../models/great_movie_model.dart';
import '../repositories/i_firestore_great_movies_repository.dart';

class MovieAddViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  updateMovie(GreatMovieModel greatMovie, DateTime dateTime, double rating,
      String review) async {
    setLoading(true);
    IFirestoreGreatMoviesRepository fsGreatMoviesRepo =
        locator<IFirestoreGreatMoviesRepository>();
    greatMovie.dateWatched = DateFormat('yyyy-MM-dd').format(dateTime);
    greatMovie.userStarRating = rating;
    greatMovie.userReview = review;
    greatMovie.isWatched = true;
    await fsGreatMoviesRepo.updateGreatMovie(greatMovie);
    setLoading(false);
  }
}
