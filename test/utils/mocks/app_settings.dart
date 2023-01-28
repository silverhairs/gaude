import 'package:gaude/src/shared/shared.dart';
import 'package:mocktail/mocktail.dart';

class MockOpenAppSettings extends Mock implements OpenAppSettings {
  bool _isOpen = false;

  @override
  Future<void> call() async {
    _isOpen = true;
  }

  @override
  bool get appSettingsOpened => _isOpen;
}
