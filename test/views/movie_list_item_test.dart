import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/view_models/movie_list_item_view_model.dart';
import 'package:grekino/views/movie_list_item.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';

import '../mock_data.dart';
import 'movie_list_item_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<MovieListItemViewModel>(),
])
void main() {
  late MockMovieListItemViewModel mockMovieListItemViewModel;
  setUp(() {
    mockMovieListItemViewModel = MockMovieListItemViewModel();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<MovieListItemViewModel>.value(
      value: mockMovieListItemViewModel,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Given not loading, When view appears, Then show movie details', (widgetTester) async {
    var greatMovie = localGreatMovies[0];
    when(mockMovieListItemViewModel.loading).thenReturn(false);
    await widgetTester.pumpWidget(
      makeTestableWidget(
          MovieListItem(pageTitle: 'test', greatMovie: greatMovie)),
      const Duration(milliseconds: 500),
    );

    final titleFinder = find.text('test');
    final nameFinder = find.text(greatMovie.name!);

    expect(titleFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
  });
  testWidgets('Given loading, When view appears, Then show circular progress', (widgetTester) async {
    var greatMovie = localGreatMovies[0];
    when(mockMovieListItemViewModel.loading).thenReturn(true);
    await widgetTester.pumpWidget(
      makeTestableWidget(
          MovieListItem(pageTitle: 'test', greatMovie: greatMovie)),
      const Duration(milliseconds: 500),
    );

    final titleFinder = find.text('test');
    final nameFinder = find.text(greatMovie.name!);
    final circularProgress = find.byType(CircularProgressIndicator);

    expect(titleFinder, findsOneWidget);
    expect(nameFinder, findsNothing);
    expect(circularProgress, findsOneWidget);
  });
  testWidgets('Given not loading, When movie isWatched is true, Then do NOT show fab button', (widgetTester) async {
    var greatMovie = localGreatMovies[0];
    greatMovie.isWatched = true;
    when(mockMovieListItemViewModel.loading).thenReturn(false);
    await widgetTester.pumpWidget(
      makeTestableWidget(
          MovieListItem(pageTitle: 'test', greatMovie: greatMovie)),
      const Duration(milliseconds: 500),
    );

    final titleFinder = find.text('test');
    final nameFinder = find.text(greatMovie.name!);
    final fabButton = find.byType(FloatingActionButton);

    expect(titleFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(fabButton, findsNothing);
  });
  testWidgets('Given not loading, When movie isWatched is false, Then do show fab button', (widgetTester) async {
    var greatMovie = localGreatMovies[0];
    greatMovie.isWatched = false;
    when(mockMovieListItemViewModel.loading).thenReturn(false);
    await widgetTester.pumpWidget(
      makeTestableWidget(
          MovieListItem(pageTitle: 'test', greatMovie: greatMovie)),
      const Duration(milliseconds: 500),
    );

    final titleFinder = find.text('test');
    final nameFinder = find.text(greatMovie.name!);
    final fabButton = find.byType(FloatingActionButton);

    expect(titleFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(fabButton, findsOneWidget);
  });
}
