import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';

import '../repositories/i_firestore_great_movies_repository.dart';
import '../repositories/i_local_great_movies_repository.dart';
import '../services/i_connectivity_service.dart';

class GreatMoviesProvider extends IGreatMoviesProvider {
  final IConnectivityService connectivityService;
  final ILocalGreatMoviesRepository localGreatMoviesRepository;
  final IFirestoreGreatMoviesRepository firestoreGreatMoviesRepository;

  GreatMoviesProvider(
      {required this.connectivityService,
      required this.localGreatMoviesRepository,
      required this.firestoreGreatMoviesRepository});

  @override
  Future<GreatMovieModel?> getMovieForId(String id) {
    return connectivityService.isDeviceConnected
        ? firestoreGreatMoviesRepository.getMovieForId(id)
        : localGreatMoviesRepository.getMovieForId(id);
  }

  @override
  Future<GreatMovieModel?> getMovieForImdbId(String imdbId) {
    return connectivityService.isDeviceConnected
        ? firestoreGreatMoviesRepository.getMovieForImdbId(imdbId)
        : localGreatMoviesRepository.getMovieForImdbId(imdbId);
  }

  @override
  Stream<List<GreatMovieModel>> getMoviesForVolume(int volume) {
    if (connectivityService.isDeviceConnected) {
      var moviesStream = firestoreGreatMoviesRepository.getMoviesForVolume(volume);
      localGreatMoviesRepository.insertMoviesForVolume(volume, moviesStream);
      return moviesStream;
    } else {
      return localGreatMoviesRepository.getMoviesForVolume(volume);
    }
  }

  @override
  Future<List<GreatMovieModel>> searchMovies(String searchTerm) {
    return localGreatMoviesRepository.searchMovies(searchTerm);
  }

  @override
  Future<void> updateGreatMovie(GreatMovieModel? greatMovie) async {
    if (greatMovie != null) {
      connectivityService.isDeviceConnected
          ? await firestoreGreatMoviesRepository.updateGreatMovie(greatMovie)
          : await localGreatMoviesRepository.updateGreatMovie(greatMovie);
    }
  }

}
