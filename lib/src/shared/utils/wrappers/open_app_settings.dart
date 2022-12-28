import 'package:permission_handler/permission_handler.dart';

class OpenAppSettings {
  OpenAppSettings();

  bool _isOpen = false;

  Future<void> call() async {
    _isOpen = await openAppSettings();
  }

  bool get appSettingsOpened => _isOpen;
}
