part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState.initial() = _Initial;
  const factory AppSettingsState.loading() = _Loading;
  const factory AppSettingsState.loaded(AppSettings appSettings) = _Loaded;
  const factory AppSettingsState.failed(Failure failure) = _Failed;
}
