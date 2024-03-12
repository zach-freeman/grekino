import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  final WidgetTester tester;
  HomeRobot(this.tester);

  Future<void> clickProfileButton() async {
    final profileButtonFinder = find.byKey(const Key('profileButton'));

    await tester.ensureVisible(profileButtonFinder);
    await tester.tap(profileButtonFinder);

    await tester.pumpAndSettle();
  }

  Future<void> clickSearchButton() async {
    final searchButtonFinder = find.byKey(const Key('searchButton'));

    await tester.ensureVisible(searchButtonFinder);
    await tester.tap(searchButtonFinder);

    await tester.pumpAndSettle();
  }
}
