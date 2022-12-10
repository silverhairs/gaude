import 'package:flutter/widgets.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class CrashReportRepository {
  Future<void> recordException(Failure failure, {bool isFatal = false});

  Future<void> recordFlutterError(FlutterErrorDetails details);

  Future<void> startAppWithCrashReporting(Widget app);
}
