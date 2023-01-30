import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

typedef ScopeCallback = FutureOr<void> Function(Scope);

/// {@template sentry}
/// A wrapper around the [Sentry] SDK that exposes only the necessary calls to the
/// sentry API.
/// {@endtemplate sentry}
class SentryWrapper {
  /// {@macro sentry}
  SentryWrapper({
    required String dsn,
    required Logger logger,
  }) : _log = logger {
    SentryFlutter.init((options) => options.dsn = dsn)
        .then((_) => _log.i('Sentry initialzed'))
        .onError((e, s) => _log.e('Failed to initialze sentry', e, s));
  }
  final Logger _log;

  Future<void> captureException(
    Object exception, {
    StackTrace? stackTrace,
    Object? hint,
    ScopeCallback? scopeCallback,
  }) async {
    try {
      _log.e(hint, exception, stackTrace);
      if (kReleaseMode) {
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
          hint: hint,
          withScope: scopeCallback,
        );
      }
    } catch (e, s) {
      _log.e('Sentry failed to capture exception', e, s);
    }
  }
}
