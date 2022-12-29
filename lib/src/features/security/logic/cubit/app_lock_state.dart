part of 'app_lock_cubit.dart';

@freezed
class AppLockState with _$AppLockState {
  const factory AppLockState.initial() = _Initial;
  const factory AppLockState.authenticated() = _Authenticated;
  const factory AppLockState.biometricAvailable() = _BiometricAvailable;
  const factory AppLockState.notUnrolled() = _NotUnrolled;
  const factory AppLockState.unavailable() = _Unavailable;
  const factory AppLockState.unauthenticated() = _Unauthenticated;
  const factory AppLockState.pending() = _Pending;
  const factory AppLockState.failed(Failure failure) = _Failed;
}
