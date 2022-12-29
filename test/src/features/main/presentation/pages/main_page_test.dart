import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/features/features.dart';

import '../../../../../utils/helpers.dart';
import '../../../../../utils/mocks/authentication/fakes.dart';

extension on BottomBarTab {
  /// A text that allows to identify a page.
  String get identifiableText {
    switch (this) {
      case BottomBarTab.home:
        return 'Account Balance';
      case BottomBarTab.transactions:
        return 'You have no transaction';
      case BottomBarTab.budget:
        return 'Ongoing Budget';
      case BottomBarTab.profile:
        return testUser.name;
    }
  }
}

void main() {
  group('[$MainPage]', () {
    testWidgets(
      'should have a bottom navigation bar and a floating action button',
      (tester) async {
        await openMainPage(tester);

        expect(find.byType(MainPage), findsOneWidget);
        expect(
          find.byKey(const ValueKey(MainPage.floatingActionButtonKey)),
          findsOneWidget,
        );

        for (final tab in BottomBarTab.values) {
          expect(find.text(tab.label), findsOneWidget);
          expect(find.byIcon(tab.icon), findsOneWidget);
        }
      },
    );

    testWidgets(
      'should open another tab page when the user taps on a bottom navigation bar item.',
      (tester) async {
        await openMainPage(tester);

        expect(find.text(BottomBarTab.home.identifiableText), findsOneWidget);
        expect(find.text(BottomBarTab.profile.identifiableText), findsNothing);

        for (int count = 1; count < BottomBarTab.values.length; count++) {
          final tab = BottomBarTab.values[count];
          final prev = BottomBarTab.values[count - 1];

          await tester.tap(find.text(tab.label));
          await tester.pumpAndSettle();

          expect(find.text(tab.identifiableText), findsOneWidget);
          expect(find.text(prev.identifiableText), findsNothing);
        }
      },
    );

    testWidgets(
      'should keep the bottom navigation bar active even after the user navigates to another page.',
      (tester) async {
        await openMainPage(tester);

        await tester.tap(find.byKey(HomePage.notificationsIconKey));
        await tester.pumpAndSettle();
        expect(find.text('Notifications'), findsOneWidget);

        for (final tab in BottomBarTab.values) {
          expect(find.text(tab.label), findsOneWidget);
          expect(find.byIcon(tab.icon), findsOneWidget);
        }
      },
    );

    testWidgets(
      'should show the user the last active page on a tab when they come back to the tab '
      'after being on another tab.',
      (tester) async {
        await openMainPage(tester);

        await tester.tap(find.byKey(HomePage.notificationsIconKey));
        await tester.pumpAndSettle();
        expect(find.text('Notifications'), findsOneWidget);

        await tester.tap(find.text(BottomBarTab.values.last.label));
        await tester.pumpAndSettle();
        expect(
          find.text(BottomBarTab.values.last.identifiableText),
          findsOneWidget,
        );

        await tester.tap(find.text(BottomBarTab.values.first.label));
        await tester.pumpAndSettle();

        expect(find.text('Notifications'), findsOneWidget);
      },
    );

    testWidgets(
      'should send the user back to the first page of the tab when the user is '
      'on a further page of the active tab and they press the active tab again',
      (tester) async {
        await openMainPage(tester);

        await tester.tap(find.byKey(HomePage.notificationsIconKey));
        await tester.pumpAndSettle();
        expect(find.text('Notifications'), findsOneWidget);

        await tester.tap(find.text(BottomBarTab.values.first.label));
        await tester.pumpAndSettle();
        expect(find.text(BottomBarTab.values.first.identifiableText),
            findsOneWidget);

        await tester.tap(find.byKey(HomePage.notificationsIconKey));
        await tester.pumpAndSettle();
        expect(find.text('Notifications'), findsOneWidget);

        await tester.tap(find.text(BottomBarTab.values.last.label));
        await tester.pumpAndSettle();
        expect(find.text(BottomBarTab.values.last.identifiableText),
            findsOneWidget);

        await tester.tap(find.text(BottomBarTab.values.first.label));
        await tester.tap(find.text(BottomBarTab.values.first.label));
        await tester.pumpAndSettle();
        expect(find.text(BottomBarTab.values.first.identifiableText),
            findsOneWidget);
      },
    );
  });
}
