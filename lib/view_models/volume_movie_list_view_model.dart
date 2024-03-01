import 'package:flutter/foundation.dart';
import 'package:grekino/locator.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';
import 'package:grekino/repositories/i_local_great_movies_repository.dart';
import 'package:grekino/services/i_connectivity_service.dart';

class VolumeMovieListViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  Stream<List<GreatMovieModel>>? _streamGreatMovies;
  Stream<List<GreatMovieModel>>? get streamGreatMovies => _streamGreatMovies;

  late IFirestoreGreatMoviesRepository fsGreatMoviesRepo;
  late ILocalGreatMoviesRepository localGreatMoviesRepo;
  late IConnectivityService connectivityService;

  VolumeMovieListViewModel({IFirestoreGreatMoviesRepository? firestoreGreatMoviesRepository}) {
    fsGreatMoviesRepo = firestoreGreatMoviesRepository ?? locator.get<IFirestoreGreatMoviesRepository>();
    connectivityService = locator.get<IConnectivityService>();
    localGreatMoviesRepo = locator.get<ILocalGreatMoviesRepository>();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setGreatMovieList(Stream<List<GreatMovieModel>> snapshot) {
    _streamGreatMovies = snapshot;
  }

  getGreatMovies(int volume) async {
    setLoading(true);
    if (connectivityService.isDeviceConnected) {
      var greatMovieList = fsGreatMoviesRepo.getMoviesForVolume(volume);
      setGreatMovieList(greatMovieList);
      await localGreatMoviesRepo.insertMoviesForVolume(volume, greatMovieList);
    } else {
      var greatMovieList = localGreatMoviesRepo.getMoviesForVolume(volume);
      setGreatMovieList(greatMovieList);
    }
    setLoading(false);
  }

}
