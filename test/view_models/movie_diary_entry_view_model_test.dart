import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/repositories/i_tmdb_repository.dart';
import 'package:grekino/view_models/movie_diary_entry_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_data.dart';
import 'movie_diary_entry_view_model_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IGreatMoviesProvider>(),
  MockSpec<ITmdbRepository>(),
])
void main() {
  late IGreatMoviesProvider greatMoviesProvider;
  late ITmdbRepository tmdbRepository;
  late MovieDiaryEntryViewModel viewModel;
  setUp(() {
    greatMoviesProvider = MockIGreatMoviesProvider();
    tmdbRepository = MockITmdbRepository();
    viewModel = MovieDiaryEntryViewModel(
        greatMoviesProvider: greatMoviesProvider,
        tmdbRepository: tmdbRepository
    );
  });
  group('Testing Movie Diary Entry View Model', () {
    test(
        'Given id is null, When call getMovieInfo(), Then do not call greatMovieProvider',
            () async {
          await viewModel.getMovieInfo(null);
          verifyNever(greatMoviesProvider.getMovieForId(""));
        });
    test(
        'Given id is not null, When call getMovieInfo(), Then call greatMovieProvider.getMovieForId',
            () async {
          String movieId = "test";
          await viewModel.getMovieInfo(movieId);
          verify(greatMoviesProvider.getMovieForId(movieId));
        });
    test(
      'Given initial state, When call getPosterImageUrl, Then update movie and return imageUrlString',
        () async {

      });
  });
}