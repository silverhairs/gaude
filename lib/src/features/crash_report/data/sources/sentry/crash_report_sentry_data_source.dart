import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:gaude/src/features/crash_report/data/sources/crash_report_data_source.dart';
import 'package:gaude/src/features/crash_report/data/sources/sentry/sentry_wrapper.dart';
import 'package:gaude/src/shared/models/failure.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';

class CrashReportSentryDataSource implements CrashReportDataSource {
  const CrashReportSentryDataSource(SentryWrapper sentry) : _sentry = sentry;

  final SentryWrapper _sentry;

  @override
  FutureOr<void> recordException(
    Failure failure, {
    bool isFatal = false,
  }) async {
    try {
      await _sentry.captureException(
        failure.error,
        stackTrace: failure.stackTrace,
      );
    } catch (e, s) {
      throw DataSourceException(
        'Sentry failed to capture error due to $e',
        stackTrace: s,
      );
    }
  }

  @override
  FutureOr<void> recordFlutterError(FlutterErrorDetails details) async {
    try {
      await _sentry.captureException(
        details.exception,
        stackTrace: details.stack,
        hint: details,
      );
    } catch (e, s) {
      throw DataSourceException(
        'Sentry failed to capture FlutterErrorDetails due to $e',
        stackTrace: s,
      );
    }
  }
}
