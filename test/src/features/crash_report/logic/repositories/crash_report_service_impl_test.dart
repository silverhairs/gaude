import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/models/failure.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';
import 'package:logger/logger.dart';
import 'package:mocktail/mocktail.dart';

class MockCrashReportDataSource extends Mock implements CrashReportDataSource {}

class MockLogger extends Mock implements Logger {}

void main() {
  late final CrashReportService subject;
  late final CrashReportDataSource dataSource;
  late final Logger logger;
  final failure = Failure(
    DataSourceException('testing error', stackTrace: StackTrace.current),
    StackTrace.current,
  );
  final flutterError = FlutterErrorDetails(
    exception: failure.error,
    stack: failure.stackTrace,
  );

  setUpAll(() {
    dataSource = MockCrashReportDataSource();
    logger = MockLogger();
    subject = CrashReportServiceImpl(dataSource: dataSource, logger: logger);

    registerFallbackValue(failure);
    registerFallbackValue(failure.error);
    registerFallbackValue(failure.stackTrace);
    registerFallbackValue(flutterError);

    when(() => logger.d(any(), any(), any())).thenReturn(null);
    when(() => logger.e(any(), any(), any())).thenReturn(null);
  });
  group('Successful records', () {
    setUpAll(() {
      when(
        () => dataSource.recordException(any(), isFatal: any(named: 'isFatal')),
      ).thenAnswer((_) => Future.value());

      when(() => dataSource.recordFlutterError(any())).thenAnswer(
        (_) => Future.value(),
      );
    });

    group('recordException()', () {
      test('should report the failure to the data source', () async {
        await subject.recordException(failure);

        verify(() => dataSource.recordException(failure)).called(1);
      });

      test('should log the error to the console', () {
        subject.recordException(failure);

        verify(() => logger.d(any(), any(), any())).called(1);
      });
    });

    group('recordFlutterError()', () {
      test('should report the error to the data source', () async {
        await subject.recordFlutterError(flutterError);

        verify(() => dataSource.recordFlutterError(flutterError)).called(1);
      });

      test('should log the error to the console', () {
        subject.recordFlutterError(flutterError);

        verify(() => logger.d(any(), any(), any())).called(greaterThan(0));
      });
    });

    group('runZonedGuardedWithCrashReport()', () {
      testWidgets(
        'should run the callback in a guarded zone.',
        (tester) async {
          await subject.runZonedGuardedWithCrashReport(
            () async {
              await tester.pumpWidget(
                const MaterialApp(home: Scaffold(body: Text('Hello World'))),
              );
              await tester.pumpAndSettle();
            },
          );

          expectSync(find.text('Hello World'), findsOneWidget);
        },
      );

      test(
        'should call recordException when an error occurs in the zone where the app is ran.',
        () async {
          await subject.runZonedGuardedWithCrashReport(
            () => throw Exception('testing error'),
          );

          verify(
            () => dataSource.recordException(any(), isFatal: true),
          ).called(1);
        },
      );
    });
  });

  group('Failed records', () {
    setUpAll(() {
      when(
        () => dataSource.recordException(any(), isFatal: any(named: 'isFatal')),
      ).thenThrow(failure.error);

      when(() => dataSource.recordFlutterError(any())).thenThrow(failure.error);
    });

    group('recordException()', () {
      test('should log the error to the console', () {
        subject.recordException(failure);

        verify(() => logger.e(any(), any(), any())).called(1);
      });
    });

    group('recordFlutterError()', () {
      test('should log the error to the console', () {
        subject.recordFlutterError(flutterError);

        verify(() => logger.e(any(), any(), any())).called(1);
      });
    });
  });
}
