import 'package:gaude/src/shared/shared.dart';

class MockOpenAppSettings implements OpenAppSettings {
  bool _isOpen = false;

  @override
  Future<void> call() async {
    _isOpen = true;
  }

  @override
  bool get appSettingsOpened => _isOpen;
}
