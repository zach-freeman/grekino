

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grekino/views/home_view.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  testWidgets('tap on the floating action button, verify counter',
          (tester) async {
        // Load app widget.
        await tester.pumpWidget(HomeView());

        // Verify the counter starts at 0.
        expect(find.text('Grekino'), findsOneWidget);

        // Finds the floating action button to tap on.
        final fab = find.byKey(const Key('increment'));

        // Emulate a tap on the floating action button.
        await tester.tap(fab);

        // Trigger a frame.
        await tester.pumpAndSettle();

        // Verify the counter increments by 1.
        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      });
}