import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/app/app.dart';
import 'package:gaude/src/app/bloc_observer.dart';
import 'package:gaude/src/di/di.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'injector.dart';
import 'mocks/data.dart';
import 'mocks/firebase.dart';

typedef FutureOrCallback = FutureOr<void> Function();

/// Calls [prepareDependencies] then starts the app and waits for the first frame.
/// This function is meant to be called from within a test case.
Future<void> startApp(
  WidgetTester tester, {
  Account account = kTestAccount,
  bool enableLogging = false,
  bool signedIn = true,
  bool isOnboardingCompleted = true,
  bool isDarkMode = false,
}) async {
  prepareDependencies(
    account: account,
    enableLogging: enableLogging,
    signedIn: signedIn,
    isOnboardingCompleted: isOnboardingCompleted,
    isDarkMode: isDarkMode,
  );

  await mockAllNetworkImages(() async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
  });
}

/// A helper function that prepare the testing environment for a test case.
///
/// This function is meant to be called from within a test case. Once the test
/// is finished, the dependencies are disposed.
///
/// The [account] parameter is used to configure the account and authentication
/// modules. Depending on the value, the authentication module will
/// emit either [AuthenticationState.authenticated] or [AuthenticationState.unauthenticated].
///
/// The [account] parameter also configures all modules that require access to the
/// account data.
///
/// The [enableLogging] parameter is used to attach a bloc observer that will
/// log all state changes. This is useful for debugging.
void prepareDependencies({
  Account account = kTestAccount,
  bool enableLogging = false,
  bool signedIn = true,
  bool isOnboardingCompleted = true,
  bool isDarkMode = false,
}) {
  TestInjector.configure(
    signedIn: signedIn,
    firebaseUser: account.getFirebaseMockUser(),
  );

  if (enableLogging) {
    Bloc.observer = LogBlocObserver();
  }

  if (signedIn) {
    final firestore = inject<FirebaseFirestore>() as FakeFirebaseFirestore;
    firestore;
    FirestoreSetup.setData(
      firestore,
      collection: AccountFirestoreDataSource.collectionName,
      documentId: account.user.id,
      data: isOnboardingCompleted
          ? account
              .copyWith(
                settings: AccountSettings(
                  currency: const Currency(
                    code: 'EUR',
                    name: 'Euro',
                    symbol: '€',
                  ),
                  updatedAt: DateTime.now(),
                ),
              )
              .toJson()
          : account.toJson(),
    );
  }

  addTearDown(TestInjector.dispose);
}

/// Calls the [callback] function within a sandbox where network images will
/// be mocked.
T mockAllNetworkImages<T>(T Function() callback) {
  return mockNetworkImagesFor(callback);
}

/// Same as
/// ```dart
/// find.byKey(key);
/// ```
Finder findKey(Key key) => find.byKey(key);

/// Same as
/// ```dart
/// find.byWidget(widget);
/// ```
Finder findWidget(Widget widget) => find.byWidget(widget);

/// Same as
/// ```dart
/// find.byType(type);
/// ```
Finder findType(Type type) => find.byType(type);

/// Same as
/// ```dart
/// find.text(text);
/// ```
Finder findText(String text) => find.text(text);

/// Same as
/// ```dart
/// find.image(image);
/// ```
Finder findImage(ImageProvider image) => find.image(image);

/// Same as
/// ```dart
/// find.byIcon(icon);
/// ```
Finder findIcon(IconData icon) => find.byIcon(icon);

extension FinderX on Finder {
  /// Calls [expect] with the [findsOneWidget] matcher.
  void once() {
    expect(this, findsOneWidget);
  }

  /// Calls [expect] with the [findsNWidgets] matcher.
  void times(int times) {
    expect(this, findsNWidgets(times));
  }

  /// Calls [expect] with the [findsNothing] matcher.
  void never() {
    expect(this, findsNothing);
  }
}
