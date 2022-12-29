import 'package:local_auth/local_auth.dart';
import 'package:mocktail/mocktail.dart';

import '../interfaces.dart';

class MockLocalAuthentication extends Mock implements LocalAuthentication {}

class LocalAuthenticationStubs implements StubsManager {
  const LocalAuthenticationStubs(this.auth);
  final LocalAuthentication auth;

  When<Future<bool>> _authenticate() => when(
        () => auth.authenticate(localizedReason: any(named: 'localizedReason')),
      );

  When<Future<bool>> _checkBiometrics() => when(() => auth.canCheckBiometrics);
  When<Future<bool>> _isDeviceSupported() => when(auth.isDeviceSupported);
  When<Future<List<BiometricType>>> _getBiometrics() =>
      when(auth.getAvailableBiometrics);

  @override
  void setupStubs({bool success = true}) {
    final stubs = [
      _checkBiometrics,
      _authenticate,
      _isDeviceSupported,
      _getBiometrics
    ];

    for (final stub in stubs) {
      _attachOutput(stub(), success);
    }
  }

  void _attachOutput(When stub, bool success) {
    if (success) {
      if (stub is When<Future<List<BiometricType>>>) {
        stub.thenAnswer(
          (_) => Future.value([BiometricType.face, BiometricType.fingerprint]),
        );
      } else {
        stub.thenAnswer((_) => Future.value(true));
      }
      return;
    }

    stub.thenThrow(Exception());
  }
}
