import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required bool isDarkMode,
    required OnboardingStatus onboardingStatus,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  factory AppSettings.initial() => const AppSettings(
        isDarkMode: false,
        onboardingStatus: OnboardingStatus.notStarted,
      );
}

enum OnboardingStatus { notStarted, inProgress, completed }
