import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/app/app.dart';
import 'package:gaude/src/di/inject.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

import '../../utils/helpers.dart';

class FakeGoogleAuthCredential extends Fake implements GoogleAuthCredential {}

void main() {
  group('[$LoginPage]', () {
    testWidgets(
      'should show the correct image, title, subtitle, a Sign Up button and a Sign In With Google button',
      (tester) async {
        prepareDependencies(signedIn: false, isOnboardingCompleted: false);
        await tester.pumpWidget(const App());
        await tester.pumpAndSettle();

        findType(LoginPage).once();
        findImage(const AssetImage(AppImages.payingHand)).once();
        findText('Gain total control over your finances.').once;
        findText('Become your own money manager and make every cent count')
            .once();
        findText('Sign Up').once();
        findText('Continue with Google').once();
      },
    );

    testWidgets(
      'should show a message when the user tries to authenticate and fails.',
      (tester) async {
        prepareDependencies(signedIn: false, isOnboardingCompleted: false);
        await tester.runAsync(
          () async {
            final auth = inject<FirebaseAuth>();
            whenCalling(Invocation.method(#signInWithCredential, null))
                .on(auth)
                .thenThrow(
                  FirebaseAuthException(code: 'failed-to-authenticate'),
                );

            await tester.pumpWidget(const App());
            await tester.pumpAndSettle();
            await tester.tap(find.text('Continue with Google'));
            await tester.pumpAndSettle();

            findText('Failed To Authenticate').once();
            await tester.pumpAndSettle(NotificationFlushbar.activeDuration);
          },
        );
      },
    );
  });

  group('Signed In User', () {
    testWidgets(
      "should be promped to onboarding page if it's their first time signing in.",
      (tester) async {
        prepareDependencies(isOnboardingCompleted: false);

        await tester.pumpWidget(const App());
        await tester.pumpAndSettle();

        findText("Let's setup your account!").once();
        findText("Let's Go").once();
        findText(
          "We need this information to personalize your experience in the app.",
        ).once();
      },
    );
    testWidgets(
      'should be sent to the [$MainPage] if they skip the onboarding.',
      (tester) async {
        prepareDependencies(signedIn: true, isOnboardingCompleted: false);

        await tester.pumpWidget(const App());
        await tester.pumpAndSettle();

        findText("Skip").once();

        await tester.tap(find.text("Skip"));
        await tester.pumpAndSettle();

        for (final tab in BottomBarTab.values) {
          findText(tab.label).once();
          findIcon(tab.icon).once();
        }
        findKey(HomePage.notificationsIconKey).once();
        findType(FloatingActionButton).once();
        findIcon(Ionicons.add).once();
      },
    );

    testWidgets('should land on the home page tab', (tester) async {
      prepareDependencies(signedIn: true, isOnboardingCompleted: true);

      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();

      findKey(HomePage.notificationsIconKey).once();

      //TODO: Add more assertions related to content of the home page.
    });
  });
}
