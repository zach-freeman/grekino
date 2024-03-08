import 'package:grekino/providers/great_movies_provider.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/repositories/firestore_great_movies_repository.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';
import 'package:grekino/repositories/i_local_great_movies_repository.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';
import 'package:grekino/repositories/local_great_movies_repository.dart';
import 'package:grekino/repositories/tmdb_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:grekino/services/connectivity_service.dart';
import 'package:grekino/services/i_connectivity_service.dart';

final locator = GetIt.I;
void setupLocator() {
  locator.registerSingleton<IConnectivityService>(ConnectivityService());
  locator.registerSingleton<IFirestoreGreatMoviesRepository>(FireStoreGreatMovieRepository());
  locator.registerSingleton<ILocalGreatMoviesRepository>(LocalGreatMoviesRepository());
  locator.registerSingletonWithDependencies<IGreatMoviesProvider>(
      () => GreatMoviesProvider(connectivityService: locator(), localGreatMoviesRepository: locator(), firestoreGreatMoviesRepository: locator()),
      dependsOn: [ConnectivityService, LocalGreatMoviesRepository, FireStoreGreatMovieRepository],
  );
  locator.registerSingleton<ITmdbRepository>(TmdbRepository());
}
