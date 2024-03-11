import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/models/great_movie_model.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/view_models/movie_add_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_data.dart';
import 'volume_movie_list_view_model_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IGreatMoviesProvider>(),
])
void main() {
  late IGreatMoviesProvider greatMoviesProvider;
  late MovieAddViewModel viewModel;
  setUp(() {
    greatMoviesProvider = MockIGreatMoviesProvider();
    viewModel = MovieAddViewModel(greatMoviesProvider: greatMoviesProvider);
  });
  group('Testing Movie Add View Model', () {
    test(
        'Given the initial state, When call updateMovie(), Then call greatMovieProvider',
        () async {
      final GreatMovieModel original =
          GreatMovieModel.fromJson(localGreatMovies[0].toJson());
      var greatMovie = localGreatMovies[0];
      var dateTime = DateTime.now();
      var rating = 3.3;
      var review = 'Keeping it real ... real dumb!';
      await viewModel.updateMovie(greatMovie, dateTime, rating, review);
      final GreatMovieModel captured =
          verify(greatMoviesProvider.updateGreatMovie(captureAny))
              .captured
              .single;
      expect(captured, isNot(original));
      expect(captured.userReview, review);
      expect(captured.userStarRating, rating);
      expect(captured.dateWatched?.length, 10);
    });
  });
}
