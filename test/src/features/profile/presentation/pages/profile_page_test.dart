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
}
