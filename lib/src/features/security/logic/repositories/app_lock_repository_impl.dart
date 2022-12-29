import 'dart:async';

import 'package:gaude/src/features/security/logic/repositories/app_lock_repository.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:local_auth/local_auth.dart';

class AppLockRepositoryImpl implements AppLockRepository {
  const AppLockRepositoryImpl(LocalAuthentication auth) : _auth = auth;
  final LocalAuthentication _auth;

  static const authMessage = 'Please unlock the app to continue';

  @override
  Future<Result<bool>> authenticate() async {
    try {
      return Result(await _auth.authenticate(localizedReason: authMessage));
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<bool>> isBiometricAvailable() async {
    try {
      return Result(await _auth.canCheckBiometrics);
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<bool>> isBiometricEnrolled() async {
    try {
      return Result(await _auth.isDeviceSupported());
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  FutureOr<Result<bool>> isDeviceSecured() async {
    try {
      return Result(
        await _auth.canCheckBiometrics || await _auth.isDeviceSupported(),
      );
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  FutureOr<Result<bool>> isPinAvailable() async {
    try {
      return Result(await _auth.canCheckBiometrics);
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  FutureOr<Result<List<BiometricType>>> getAvailableBiometrics() async {
    try {
      return Result(await _auth.getAvailableBiometrics());
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }
}
