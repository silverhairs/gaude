import 'package:flutter/material.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

import '../interfaces.dart';

class MockCrashReportRepository extends Mock implements CrashReportService {}

class CrashReportRepositoryStubs implements StubsManager {
  CrashReportRepositoryStubs() {
    registerFallbackValue(
      const Failure(
        DataSourceException(
          'error',
          stackTrace: StackTrace.empty,
        ),
        StackTrace.empty,
      ),
    );
    registerFallbackValue(FlutterErrorDetails(exception: Exception('error')));
    setupStubs();
  }

  @override
  void setupStubs({bool success = true}) {
    if (success) {
      successfullExceptionRecord();
      successfullFlutterErrorRecord();
    } else {
      failedExceptionRecord();
      failedFlutterErrorRecord();
    }
  }

  static final CrashReportService _repository = MockCrashReportRepository();

  void successfullExceptionRecord() {
    when(() => _repository.recordException(any())).thenAnswer(
      (_) async => const Result(null),
    );
  }

  void failedExceptionRecord() {
    when(() => _repository.recordException(any())).thenAnswer(
      (_) async => Result.failure(
        const DataSourceException('failed to record exception',
                stackTrace: StackTrace.empty)
            .toFailure(),
      ),
    );
  }

  void successfullFlutterErrorRecord() {
    when(() => _repository.recordFlutterError(any())).thenAnswer(
      (_) async => const Result(null),
    );
  }

  void failedFlutterErrorRecord() {
    when(() => _repository.recordFlutterError(any())).thenAnswer(
      (_) async => Result.failure(
        const DataSourceException('failed to record flutter error',
                stackTrace: StackTrace.empty)
            .toFailure(),
      ),
    );
  }
}
