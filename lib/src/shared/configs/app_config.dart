import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppConfig {
  const AppConfig({required this.logLevel});

  final Level logLevel;

  static Level getLogLevelFromEnvironment({
    Level defaultLevel = Level.verbose,
  }) {
    if (kReleaseMode) return Level.nothing;

    const value = int.fromEnvironment('log_level', defaultValue: -1);
    return Level.values.firstWhere(
      (level) => level.index == value,
      orElse: () => defaultLevel,
    );
  }
}
