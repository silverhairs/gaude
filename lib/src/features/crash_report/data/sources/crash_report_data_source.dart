import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:gaude/src/shared/shared.dart';

abstract class CrashReportDataSource {
  FutureOr<void> recordException(Failure failure, {bool isFatal = false});

  FutureOr<void> recordFlutterError(FlutterErrorDetails details);
}
