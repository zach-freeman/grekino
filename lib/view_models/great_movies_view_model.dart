import 'package:flutter/foundation.dart';
import 'package:flutter_great_movies/locator.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/repositories/i_great_movies_repository.dart';

class GreatMoviesViewModel extends ChangeNotifier {
  bool _loading = false;
  List<GreatMovies> _greatMoviesOne = [];
  List<GreatMovies> _greatMoviesTwo = [];
  List<GreatMovies> _greatMoviesThree = [];
  List<GreatMovies> _greatMoviesFour = [];
  bool get loading => _loading;
  List<GreatMovies> get greatMoviesOne => _greatMoviesOne;
  List<GreatMovies> get greatMoviesTwo => _greatMoviesTwo;
  List<GreatMovies> get greatMoviesThree => _greatMoviesThree;
  List<GreatMovies> get greatMoviesFour => _greatMoviesFour;

  GreatMoviesViewModel() {
    getGreatMovies(1);
    getGreatMovies(2);
    getGreatMovies(3);
    getGreatMovies(4);
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setGreatMovieList(List<GreatMovies> greatMoviesList, int volume) {
    switch (volume) {
      case 1:
        _greatMoviesOne = greatMoviesList;
      case 2:
        _greatMoviesTwo = greatMoviesList;
      case 3:
        _greatMoviesThree = greatMoviesList;
      case 4:
        _greatMoviesFour = greatMoviesList;
    }
  }

  getGreatMovies(int volume) async {
    setLoading(true);
    IGreatMoviesRepository greatMoviesRepository =
        locator<IGreatMoviesRepository>();
    var greatMovieList = await greatMoviesRepository.getMoviesForVolume(volume);
    setGreatMovieList(greatMovieList, volume);
    setLoading(false);
  }
}
