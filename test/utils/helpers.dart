import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/app/bloc_observer.dart';
import 'package:gaude/src/features/features.dart';

import 'injector.dart';

typedef FutureOrCallback = FutureOr<void> Function();

/// A helper function that calls the passed [callback] in a scope where all the
/// dependencies from the IOC container are provided.
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
/// The [enableLogging] parameter is used to enable logging of all blocs.
Future<void> injectorScope(
  FutureOrCallback callback, {
  Account? account,
  bool enableLogging = false,
  bool signedIn = false,
}) async {
  TestInjector.configure(account: account, signedIn: signedIn);
  if (enableLogging) {
    Bloc.observer = LogBlocObserver();
  }
  await callback();
  addTearDown(TestInjector.dispose);
}
