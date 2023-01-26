import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:logger/logger.dart';

class CrashReportServiceImpl implements CrashReportService {
  const CrashReportServiceImpl({
    required CrashReportDataSource dataSource,
    required Logger logger,
  })  : _source = dataSource,
        _logger = logger;
  final CrashReportDataSource _source;
  final Logger _logger;

  @override
  Future<void> recordException(Failure failure, {bool isFatal = false}) async {
    try {
      await _source.recordException(failure, isFatal: isFatal);
      _logger.d(failure, failure.error, failure.stackTrace);
    } on GaudeException catch (e, s) {
      _logger.e(e.message, e, s);
    }
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails details) async {
    try {
      await _source.recordFlutterError(details);
      _logger.d(details, details.exception, details.stack);
    } on GaudeException catch (e, s) {
      _logger.e(e.message, e, s);
    }
  }

  @override
  Future<void> runZonedGuardedWithCrashReport(fn) async {
    runZonedGuarded(fn, (e, s) {
      final failure = Failure(e, s);
      recordException(failure, isFatal: true);
    });
  }
}
