

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/providers/i_great_movies_provider.dart';
import 'package:grekino/view_models/volume_movie_list_view_model.dart';
import 'package:grekino/views/home_view.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../test/mock_data.dart';
import 'app_test.mocks.dart';
import 'robots/home_robot.dart';
@GenerateNiceMocks([
  MockSpec<IGreatMoviesProvider>(),
])
void main() {
  late VolumeMovieListViewModel volumeMovieListViewModel;
  late MockIGreatMoviesProvider mockGreatMoviesProvider;
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW
  HomeRobot homeRobot;
  setUp(() {
    mockGreatMoviesProvider = MockIGreatMoviesProvider();
    volumeMovieListViewModel = VolumeMovieListViewModel(greatMoviesProvider: mockGreatMoviesProvider);
    when(mockGreatMoviesProvider.getMoviesForVolume(1))
    .thenAnswer((_) => Stream.fromIterable([localGreatMovies]));
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<VolumeMovieListViewModel>.value(
      value: volumeMovieListViewModel,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('tap on the search button',
          (tester) async {
        // Load app widget.
        await tester.pumpWidget(makeTestableWidget(HomeView()));

        // Trigger a frame.
        await tester.pumpAndSettle();

        // Verify the title
        expect(find.text('Grekino'), findsOneWidget);

        // Click the search button and go back.
        homeRobot = HomeRobot(tester);
        await homeRobot.clickSearchButton();
      });
}