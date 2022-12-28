// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/shared/models/failure.dart';

extension BlocExt<T> on BlocBase<T> {
  void addFailure(Failure failure) => addError(
        failure.error,
        StackTrace.current,
      );

  /// Emits a state and add pipe [failure] to the [BlocObserver].
  void emitFailure(T state, Failure failure) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state);
    addFailure(failure);
  }
}
