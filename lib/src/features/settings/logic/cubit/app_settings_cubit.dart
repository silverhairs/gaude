import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/settings/data/models/app_settings.dart';
import 'package:gaude/src/features/settings/logic/repositories/app_settings_repository.dart';
import 'package:gaude/src/shared/shared.dart';

part 'app_settings_cubit.freezed.dart';
part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit(AppSettingsRepository repository)
      : _repository = repository,
        super(const AppSettingsState.initial());

  final AppSettingsRepository _repository;

  Future<void> loadAppSettings() async {
    emit(const AppSettingsState.loading());
    final result = await _repository.getAppSettings();
    result.when(
      (settings) {
        var status = settings.onboardingStatus;
        if (status == OnboardingStatus.notStarted) {
          status = OnboardingStatus.inProgress;
          saveAppSettings(settings.copyWith(onboardingStatus: status));
          return;
        }
        emit(AppSettingsState.loaded(settings));
      },
      failure: (failure) {
        emit(AppSettingsState.failed(failure));
        addFailure(failure);
      },
    );
  }

  Future<void> saveAppSettings(AppSettings appSettings) async {
    emit(const AppSettingsState.loading());
    final result = await _repository.saveAppSettings(appSettings);
    result.when(
      (_) async => await loadAppSettings(),
      failure: (failure) {
        emit(AppSettingsState.failed(failure));
        addFailure(failure);
      },
    );
  }
}
