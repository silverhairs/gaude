import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/profile/logic/cubit/account_cubit.dart';
import 'package:gaude/src/shared/shared.dart';

class AccountUpdateFailureListener
    extends BlocListener<AccountCubit, AccountState> {
  AccountUpdateFailureListener({
    Key? key,
    ValueChanged<Failure>? onFailedToSave,
    ValueChanged<Failure>? onFailedToLoad,
    Widget? child,
  }) : super(
          key: key,
          child: child,
          listener: (context, state) => state.whenOrNull<void>(
            failedToSave: (failure) {
              context.showFlushbar(
                NotificationFlushbar(
                  isError: true,
                  title: 'Account Error',
                  message: 'Failed to update account data. Make sure you are '
                      'connected to the internet and try again.',
                ),
              );

              onFailedToSave?.call(failure);
            },
            failedToLoad: onFailedToLoad,
          ),
        );
}
