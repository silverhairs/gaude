import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/di/inject.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/helpers.dart';
import '../../../../../utils/mocks/authentication/mocks.dart';

void main() {
  group('[$LoginPage]', () {
    testWidgets(
      'should show the correct image, title, subtitle, a Sign Up button and a Sign In With Google button',
      (tester) async {
        await startAppWithMocks(tester: tester, authenticated: false);

        expect(find.byType(LoginPage), findsOneWidget);
        expect(
          find.image(const AssetImage(AppImages.payingHand)),
          findsOneWidget,
        );
        expect(
          find.text('Gain total control over your finances.'),
          findsOneWidget,
        );
        expect(
          find.text('Become your own money manager and make every cent count'),
          findsOneWidget,
        );

        expect(find.text('Sign Up'), findsOneWidget);
        expect(find.text('Continue with Google'), findsOneWidget);
      },
    );

    testWidgets(
      'tapping on the `Continue with Google` button should trigger the login.',
      (tester) async {
        await startAppWithMocks(tester: tester, authenticated: false);

        await tester.tap(find.text('Continue with Google'));
        await tester.pumpAndSettle();

        verify(inject<AccountCredentialRepository>().getCredential).called(1);
        verify(() => inject<AuthenticationRepository>().login(any())).called(1);
      },
    );

    testWidgets(
      'should show a message when the user tries to authenticate and fails.',
      (tester) async {
        await startAppWithMocks(tester: tester, authenticated: false);

        AuthenticationRepositoryStubs(inject()).failedLogin();

        await tester.tap(find.text('Continue with Google'));
        await tester.pumpAndSettle(kThemeAnimationDuration);

        expect(find.text('Failed To Authenticate'), findsOneWidget);
        await tester.pumpAndSettle(NotificationFlushbar.activeDuration);
      },
    );
  });

  testWidgets(
    'The user should be sent to the [$MainPage] if they are authenticated in.',
    (tester) async {
      await startAppWithMocks(tester: tester, authenticated: true);
      await tester.pumpAndSettle();
      expect(find.byType(MainPage), findsOneWidget);
    },
  );
}
