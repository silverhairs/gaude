import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/di/di.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/models/failure.dart';
import 'package:gaude/src/shared/utils/exceptions.dart';
import 'package:logger/logger.dart';

class LogBlocObserver extends BlocObserver {
  LogBlocObserver() : _logger = inject<Logger>();
  final Logger _logger;

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final failure = error is GaudeException
        ? error.toFailure()
        : Failure(error, stackTrace);

    inject<CrashReportRepository>().recordException(failure);
    _logger.e(bloc, failure.error, failure.stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.i(change);
    super.onChange(bloc, change);
  }
}
