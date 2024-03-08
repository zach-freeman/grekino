import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/view_models/volume_movie_list_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_data.dart';
import 'volume_movie_list_view_model_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IGreatMoviesProvider>(),
])
void main() {
  late IGreatMoviesProvider greatMoviesProvider;
  late VolumeMovieListViewModel viewModel;
  setUp(() {
    greatMoviesProvider = MockIGreatMoviesProvider();
    viewModel =
        VolumeMovieListViewModel(greatMoviesProvider: greatMoviesProvider);
  });
  group('Testing Volume Movie List View Model', () {
    test(
        'Given the initial state, When call getGreatMovies(), Then viewmodel should populate the list of greatMovies stream',
        () async {
          when(greatMoviesProvider.getMoviesForVolume(1))
              .thenAnswer((_) => Stream.fromIterable([firestoreGreatMovies]));
          await viewModel.getGreatMovies(1);
          expect(viewModel.streamGreatMovies, isA<Stream<List<GreatMovieModel>>>());
        });
  });
}
