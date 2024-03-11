

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/view_models/volume_movie_list_view_model.dart';
import 'package:grekino/views/home_view.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import 'app_test.mocks.dart';
import 'robots/home_robot.dart';
@GenerateNiceMocks([
  MockSpec<VolumeMovieListViewModel>(),
])
void main() {
  MockVolumeMovieListViewModel mockVolumeMovieListViewModel = MockVolumeMovieListViewModel();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW
  HomeRobot homeRobot;

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<VolumeMovieListViewModel>.value(
      value: mockVolumeMovieListViewModel,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('tap on the profile button, verify counter',
          (tester) async {
        // Load app widget.
        await tester.pumpWidget(makeTestableWidget(HomeView()));

        // Trigger a frame.
        await tester.pumpAndSettle();

        // Verify the title
        expect(find.text('Grekino'), findsOneWidget);

        // Verify the counter increments by 1.
        homeRobot = HomeRobot(tester);
        await homeRobot.clickProfileButton();
      });
}