import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaude/src/features/notifications/data/models/notification_model.dart';
import 'package:gaude/src/features/notifications/logic/repositories/notifications_repository.dart';
import 'package:gaude/src/shared/shared.dart';

part 'notifications_cubit.freezed.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(NotificationsRepository repository)
      : _repository = repository,
        super(const NotificationsState.initial()) {
    stream.listen(_recordFailure);
  }

  final NotificationsRepository _repository;

  Future<void> getNotifications() async {
    emit(const NotificationsState.loading());
    final result = await _repository.getNotifications();

    emit(
      result.when(
        NotificationsState.loaded,
        failure: NotificationsState.failed,
      ),
    );
  }

  void _recordFailure(NotificationsState state) {
    if (state is _NotificationsFailed) {
      addFailure(state.failure);
    }
  }
}
