import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:logger/logger.dart';

class CrashReportCrashlyticsDataSource implements CrashReportDataSource {
  const CrashReportCrashlyticsDataSource({
    required Logger logger,
    required FirebaseCrashlytics crashlytics,
  })  : _logger = logger,
        _crashlytics = crashlytics;

  final Logger _logger;
  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> recordException(Failure failure, {bool isFatal = false}) async {
    _logger.d(failure, failure.error, failure.stackTrace);
    try {
      await _crashlytics.recordError(
        failure.error,
        failure.stackTrace,
        fatal: isFatal,
      );
    } on Exception {
      throw const DataSourceException('Crashlytics Failed to record error');
    }
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails details) async {
    _logger.d(details);
    try {
      await _crashlytics.recordFlutterFatalError(details);
    } on Exception {
      throw const DataSourceException(
        'Crashlytics Failed to record Flutter error',
      );
    }
  }
}
