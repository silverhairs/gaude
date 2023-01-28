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
        await injectorScope(() async {
          await tester.pumpWidget(const App());
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
            find.text(
                'Become your own money manager and make every cent count'),
            findsOneWidget,
          );

          expect(find.text('Sign Up'), findsOneWidget);
          expect(find.text('Continue with Google'), findsOneWidget);
        });
      },
    );

    testWidgets(
      'should show a message when the user tries to authenticate and fails.',
      (tester) async {
        await injectorScope(
          () => tester.runAsync(() async {
            final auth = inject<FirebaseAuth>();
            whenCalling(Invocation.method(#signInWithCredential, null))
                .on(auth)
                .thenThrow(
                  FirebaseAuthException(code: 'failed-to-authenticate'),
                );
            expect(
              () => auth.signInWithCredential(FakeGoogleAuthCredential()),
              throwsA(isA<FirebaseAuthException>()),
            );

            await tester.pumpWidget(const App());
            await tester.pumpAndSettle();
            await tester.tap(find.text('Continue with Google'));
            await tester.pumpAndSettle();

            expect(find.text('Failed To Authenticate'), findsOneWidget);
            await tester.pumpAndSettle(NotificationFlushbar.activeDuration);
          }),
        );
      },
    );
  });

  testWidgets(
    'The user should be sent to the [$MainPage] if they are authenticated in.',
    (tester) async {
      await injectorScope(enableLogging: true, signedIn: true, () async {
        await tester.pumpWidget(const App());
        await tester.pump();

        for (final tab in BottomBarTab.values) {
          expect(find.text(tab.label), findsOneWidget);
          expect(find.byIcon(tab.icon), findsOneWidget);
        }
        expect(find.byIcon(Ionicons.notifications), findsOneWidget);
        expect(find.byType(FloatingActionButton), findsOneWidget);
        expect(find.byIcon(Ionicons.add), findsOneWidget);
      });
    },
  );
}
