import 'package:flutter/foundation.dart';
import 'package:grekino/locator.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';
import 'package:grekino/repositories/i_local_great_movies_repository.dart';
import 'package:grekino/services/i_connectivity_service.dart';

import '../providers/i_great_movies_provider.dart';

class VolumeMovieListViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  Stream<List<GreatMovieModel>>? _streamGreatMovies;
  Stream<List<GreatMovieModel>>? get streamGreatMovies => _streamGreatMovies;

  late IGreatMoviesProvider greatMoviesProvider;

  VolumeMovieListViewModel({required this.greatMoviesProvider});

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setGreatMovieList(Stream<List<GreatMovieModel>> moviesStream) {
    _streamGreatMovies = moviesStream;
  }

  getGreatMovies(int volume) async {
    setLoading(true);
    var greatMovieList = greatMoviesProvider.getMoviesForVolume(volume);
    setGreatMovieList(greatMovieList);
    setLoading(false);
  }

}
