import 'dart:async';

import 'package:gaude/src/shared/shared.dart';
import 'package:local_auth/local_auth.dart';

abstract class AppLockRepository {
  FutureOr<Result<bool>> isDeviceSecured();
  FutureOr<Result<bool>> isBiometricAvailable();
  FutureOr<Result<bool>> isBiometricEnrolled();
  FutureOr<Result<bool>> authenticate();
  FutureOr<Result<bool>> isPinAvailable();
  FutureOr<Result<List<BiometricType>>> getAvailableBiometrics();
}
