import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:grekino/locator.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';
import 'package:grekino/repositories/i_great_movies_repository.dart';

class VolumeMovieListViewModel extends ChangeNotifier {
  bool _loading = false;
  List<GreatMovies> _greatMovies = [];
  bool get loading => _loading;
  List<GreatMovies> get greatMovies => _greatMovies;
  late Stream<QuerySnapshot> _streamGreatMovies;
  Stream<QuerySnapshot> get streamGreatMovies => _streamGreatMovies;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setGreatMovieList(Stream<QuerySnapshot> snapshot) {
    _streamGreatMovies = snapshot;
  }

  getGreatMovies(int volume) async {
    setLoading(true);
    IFirestoreGreatMoviesRepository fsGreatMoviesRepo = locator<IFirestoreGreatMoviesRepository>();
    var greatMovieList = fsGreatMoviesRepo.getStreamForVolume(volume);
    setGreatMovieList(greatMovieList);
    setLoading(false);
  }

}
