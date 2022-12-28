import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/authentication/logic/bloc/authentication_bloc.dart';
import 'package:gaude/src/shared/shared.dart';

class AuthenticationFailureListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  AuthenticationFailureListener({super.key, ValueChanged<Failure>? onFailure})
      : super(
          listenWhen: (previous, current) {
            return current.maybeMap<bool>(
              orElse: () => false,
              failed: (_) => true,
            );
          },
          listener: (context, state) => state.whenOrNull<void>(
            failed: (failure) async {
              onFailure?.call(failure);
              await NotificationFlushbar(
                title: 'Failed To Authenticate',
                message: 'Check your internet connection and try again',
                isError: true,
              ).show(context);
            },
          ),
        );
}
