import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/providers/great_movies_provider.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/repositories/i_firestore_great_movies_repository.dart';
import 'package:grekino/repositories/i_local_great_movies_repository.dart';
import 'package:grekino/services/i_connectivity_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_data.dart';
import 'great_movies_provider_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IConnectivityService>(),
  MockSpec<ILocalGreatMoviesRepository>(),
  MockSpec<IFirestoreGreatMoviesRepository>()
])
void main() {
  late IConnectivityService connectivityService;
  late ILocalGreatMoviesRepository localGreatMoviesRepository;
  late IFirestoreGreatMoviesRepository firestoreGreatMoviesRepository;
  late IGreatMoviesProvider provider;
  const String testMovieId = "3387d0db-0aab-4ad1-b1f6-0dfa4d053f2d";
  const String testMovieImdbId = "00551155";
  const int testGreatMovieVolume = 1;
  const String testMovieSearchTerm = "test";
  setUp(() {
    connectivityService = MockIConnectivityService();
    localGreatMoviesRepository = MockILocalGreatMoviesRepository();
    firestoreGreatMoviesRepository = MockIFirestoreGreatMoviesRepository();
    provider = GreatMoviesProvider(
        connectivityService: connectivityService,
        localGreatMoviesRepository: localGreatMoviesRepository,
        firestoreGreatMoviesRepository: firestoreGreatMoviesRepository);
    when(firestoreGreatMoviesRepository.getMovieForId(testMovieId))
        .thenAnswer((_) async => firestoreGreatMovies[0]);
    when(localGreatMoviesRepository.getMovieForId(testMovieId))
        .thenAnswer((_) async => localGreatMovies[0]);
    when(firestoreGreatMoviesRepository.getMovieForImdbId(testMovieImdbId))
        .thenAnswer((_) async => firestoreGreatMovies[1]);
    when(localGreatMoviesRepository.getMovieForImdbId(testMovieImdbId))
        .thenAnswer((_) async => localGreatMovies[1]);
    when(localGreatMoviesRepository.getMoviesForVolume(testGreatMovieVolume))
        .thenAnswer((_) => Stream.fromIterable([localGreatMovies]));
    when(firestoreGreatMoviesRepository
            .getMoviesForVolume(testGreatMovieVolume))
        .thenAnswer((_) => Stream.fromIterable([firestoreGreatMovies]));
    when(localGreatMoviesRepository.searchMovies(testMovieSearchTerm))
        .thenAnswer((_) async => localGreatMovies);
  });
  group('Testing Great Movies Provider', () {
    test(
        'Given that we are connected, When call getMovieForId, Then provider should return firestore movie',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(true);
      expect(
          await provider.getMovieForId(testMovieId), firestoreGreatMovies[0]);
    });
    test(
        'Given that we are not connected, When call getMovieForId, Then provider should return local movie',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(false);
      expect(await provider.getMovieForId(testMovieId), localGreatMovies[0]);
    });
    test(
        'Given that we are connected, When call getMovieForImdbId, Then provider should return firestore movie',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(true);
      expect(await provider.getMovieForImdbId(testMovieImdbId),
          firestoreGreatMovies[1]);
    });
    test(
        'Given that we are not connected, When call getMovieForImdbId, Then provider should return local movie',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(false);
      expect(await provider.getMovieForImdbId(testMovieImdbId),
          localGreatMovies[1]);
    });
    test(
        'Given that we are not connected, When call getMoviesForVolume, Then provider should return local movies',
        () {
      when(connectivityService.isDeviceConnected).thenReturn(false);
      expect(provider.getMoviesForVolume(testGreatMovieVolume),
          emits([localGreatMovies[0], localGreatMovies[1]]));
    });
    test(
        'Given that we are connected, When call getMoviesForVolume, Then provider should return firestore movies',
        () {
      when(connectivityService.isDeviceConnected).thenReturn(true);
      expect(provider.getMoviesForVolume(testGreatMovieVolume),
          emits([firestoreGreatMovies[0], firestoreGreatMovies[1]]));
    });
    test(
        'Given that we provide a search term, When call searchMovies, Then provider should return search movies',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(true);
      expect(await provider.searchMovies(testMovieSearchTerm),
          isA<List<GreatMovieModel>>());
    });
    test(
        'Given that we are connected, When call updateGreatMovie, Then provider should call firestore repository',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(true);
      await provider.updateGreatMovie(localGreatMovies[0]);
      verify(firestoreGreatMoviesRepository
              .updateGreatMovie(localGreatMovies[0]))
          .called(1);
    });
    test(
        'Given that we are not connected, When call updateGreatMovie, Then provider should call firestore repository',
        () async {
      when(connectivityService.isDeviceConnected).thenReturn(false);
      await provider.updateGreatMovie(localGreatMovies[0]);
      verify(localGreatMoviesRepository.updateGreatMovie(localGreatMovies[0]))
          .called(1);
    });
  });
}
