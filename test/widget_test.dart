// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_deeplink_example/error_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deeplink_example/main.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_go_router_provider.dart';

void main() {
  // define mock GoRouter
  late MockGoRouter router;

  setUp(() {
    router = MockGoRouter();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    ));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  // From ErrorPage Button press navigates to the HomePage
  testWidgets('From ErrorPage button press navigates to MyHomePage', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MockGoRouterProvider(
          goRouter: router,
          child: const ErrorPage(),
        ),
      ),
    );

    expect(find.text('Halaman Tidak Ditemukan'), findsOneWidget);

    await tester.tap(find.text('Home Page'));
    await tester.pumpAndSettle();

    verify(() => router.go('/')).called(1);
  });
}
