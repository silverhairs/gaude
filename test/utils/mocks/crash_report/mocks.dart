import 'package:flutter/material.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

import '../interfaces.dart';

class MockCrashReportRepository extends Mock implements CrashReportRepository {}

class CrashReportRepositoryStubs implements StubsManager {
  CrashReportRepositoryStubs() {
    registerFallbackValue(
      Failure(const DataSourceException('error'), StackTrace.current),
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

  static final CrashReportRepository _repository = MockCrashReportRepository();

  void successfullExceptionRecord() {
    when(() => _repository.recordException(any())).thenAnswer(
      (_) async => const Result(null),
    );
  }

  void failedExceptionRecord() {
    when(() => _repository.recordException(any())).thenAnswer(
      (_) async => Result.failure(
        Failure(
          const DataSourceException('failed to record exception'),
          StackTrace.current,
        ),
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
        Failure(
          const DataSourceException('failed to record flutter error'),
          StackTrace.current,
        ),
      ),
    );
  }
}
