import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:grekino/locator.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';

class VolumeMovieListViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  Stream<QuerySnapshot>? _streamGreatMovies;
  Stream<QuerySnapshot>? get streamGreatMovies => _streamGreatMovies;

  late IFirestoreGreatMoviesRepository fsGreatMoviesRepo;

  VolumeMovieListViewModel({IFirestoreGreatMoviesRepository? firestoreGreatMoviesRepository}) {
    fsGreatMoviesRepo = firestoreGreatMoviesRepository ?? locator.get<IFirestoreGreatMoviesRepository>();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setGreatMovieList(Stream<QuerySnapshot> snapshot) {
    _streamGreatMovies = snapshot;
  }

  getGreatMovies(int volume) async {
    setLoading(true);
    var greatMovieList = fsGreatMoviesRepo.getStreamForVolume(volume);
    setGreatMovieList(greatMovieList);
    setLoading(false);
  }

}
