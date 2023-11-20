import 'package:flutter/cupertino.dart';
import 'package:grekino/repositories/i_great_movies_repository.dart';
import '../locator.dart';
import 'package:intl/intl.dart';

class MovieAddViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  updateMovie(
      String id, DateTime dateTime, double rating, String review) async {
    setLoading(true);
    IGreatMoviesRepository greatMoviesRepository =
        locator<IGreatMoviesRepository>();
    String date = DateFormat('yyyy-MM-dd').format(dateTime);
    await greatMoviesRepository.updateMovieWatchInfo(id, date, rating, review);
    setLoading(false);
  }
}
