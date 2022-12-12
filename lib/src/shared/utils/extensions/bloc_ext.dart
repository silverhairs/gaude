// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/shared/models/failure.dart';

extension BlocExt on BlocBase {
  void addFailure(Failure failure) => addError(
        failure.error,
        StackTrace.current,
      );
}
