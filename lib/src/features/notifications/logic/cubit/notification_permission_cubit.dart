import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';

part 'notification_permission_cubit.freezed.dart';
part 'notification_permission_state.dart';

class NotificationPermissionCubit extends Cubit<NotificationPermissionState> {
  NotificationPermissionCubit(NotificationsPermissionRepository repository)
      : _repository = repository,
        super(const NotificationPermissionState.initial());

  final NotificationsPermissionRepository _repository;

  Future<void> getPermissionStatus() async {
    final result = await _repository.getNotificationsPermissionStatus();
    result.when<void>(
      (status) {
        if (status == PermissionStatus.granted) {
          emit(const NotificationPermissionState.granted());
          return;
        }
        if (status == PermissionStatus.denied) {
          emit(const NotificationPermissionState.denied());
          return;
        }
        emit(const NotificationPermissionState.initial());
      },
      failure: (failure) => emitFailure(
        NotificationPermissionState.failed(failure),
        failure,
      ),
    );
  }

  Future<void> requestPermission() async {
    emit(const NotificationPermissionState.pending());
    final result = await _repository.requestNotificationsPermission();
    result.when<void>(
      (_) => getPermissionStatus(),
      failure: (failure) => emitFailure(
        NotificationPermissionState.failed(failure),
        failure,
      ),
    );
  }
}
