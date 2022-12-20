import 'package:gaude/src/features/onboarding/data/models/app_settings.dart';
import 'package:gaude/src/features/onboarding/data/sources/app_settings_data_source.dart';
import 'package:gaude/src/features/onboarding/logic/repositories/app_settings_repository.dart';
import 'package:gaude/src/shared/shared.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  const AppSettingsRepositoryImpl(AppSettingsDataSource dataSource)
      : _source = dataSource;

  final AppSettingsDataSource _source;

  @override
  Future<Result<AppSettings>> getAppSettings() async {
    try {
      final settings = await _source.getAppSettings();
      return Result(settings);
    } on GaudeException catch (e, s) {
      return Result.failure(Failure(e, s));
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }

  @override
  Future<Result<void>> saveAppSettings(AppSettings appSettings) async {
    try {
      return Result(await _source.saveAppSettings(appSettings));
    } on GaudeException catch (e, s) {
      return Result.failure(Failure(e, s));
    } catch (e, s) {
      return Result.failure(Failure(e, s));
    }
  }
}
