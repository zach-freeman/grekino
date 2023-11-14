import 'package:flutter/foundation.dart';
import 'package:flutter_great_movies/locator.dart';
import 'package:flutter_great_movies/models/great_movie_model.dart';
import 'package:flutter_great_movies/repositories/i_great_movies_repository.dart';

class VolumeMovieListViewModel extends ChangeNotifier {
  bool _loading = false;
  List<GreatMovies> _greatMovies = [];
  bool get loading => _loading;
  List<GreatMovies> get greatMovies => _greatMovies;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setGreatMovieList(List<GreatMovies> greatMoviesList) {
    _greatMovies = greatMoviesList;
  }

  getGreatMovies(int volume) async {
    setLoading(true);
    IGreatMoviesRepository greatMoviesRepository =
        locator<IGreatMoviesRepository>();
    var greatMovieList = await greatMoviesRepository.getMoviesForVolume(volume);
    setGreatMovieList(greatMovieList);
    setLoading(false);
  }
}