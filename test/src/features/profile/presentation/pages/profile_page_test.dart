import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/features/features.dart';

import '../../../../../utils/helpers.dart';
import '../../../../../utils/mocks/data.dart';

void main() {
  group('User profile', () {
    testWidgets(
      'should show the user profile picture, name and call to action for Account settings '
      'User settings, Logout and Export Data',
      (tester) async {
        await startApp(tester);

        await tester.tap(find.byIcon(BottomBarTab.profile.icon));
        await tester.pump();

        findText(kTestAccount.user.name).once();

        for (final key in ProfilePageKeys.all) {
          findKey(key).once();
        }
      },
    );
  });

  group('Settings Tile', () {
    testWidgets(
      'should open the settings page when tapped on',
      (tester) async {
        await startApp(tester);

        await tester.tap(find.byIcon(BottomBarTab.profile.icon));
        await tester.pump();

        await tester.tap(find.byKey(ProfilePageKeys.settingsCallToActionKey));
        await tester.pump();

        for (final key in SettingsPageKeys.all) {
          findKey(key).once();
        }
      },
    );
  });

  group('Log out', () {
    testWidgets(
      'should show a message where the user can confirm whether they want to log out or no,',
      (tester) async {
        await startApp(tester);

        await tester.tap(find.byIcon(BottomBarTab.profile.icon));
        await tester.pump();

        await tester.tap(find.byKey(ProfilePageKeys.logoutCallToActionKey));
        await tester.pump();

        findText('Yes').once();
        findText('No').once();
      },
    );

    testWidgets(
      'should cancel the logout flow when the user taps No',
      (tester) async {
        await startApp(tester);

        await tester.tap(find.byIcon(BottomBarTab.profile.icon));
        await tester.pump();

        await tester.tap(find.byKey(ProfilePageKeys.logoutCallToActionKey));
        await tester.pumpAndSettle();
        findText('Yes').once();
        findText('No').once();

        await tester.tap(findText('No'));
        await tester.pumpAndSettle();

        findText('No').never();
        findText('Yes').never();
        for (final key in ProfilePageKeys.all) {
          findKey(key).once();
        }
      },
    );

    testWidgets(
      'should log th user out when they confirm by tapping on "Yes"',
      (tester) async {
        await startApp(tester);

        await tester.tap(find.byIcon(BottomBarTab.profile.icon));
        await tester.pump();

        await tester.tap(find.byKey(ProfilePageKeys.logoutCallToActionKey));
        await tester.pumpAndSettle();
        findText('Yes').once();
        findText('No').once();

        await tester.tap(findText('Yes'));
        await tester.pumpAndSettle();

        for (var key in ProfilePageKeys.all) {
          findKey(key).never();
        }

        findText('Continue with Google').once();
      },
    );
  });
}
