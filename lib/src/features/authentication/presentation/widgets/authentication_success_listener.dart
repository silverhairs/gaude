import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';

class AuthenticationSuccessListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  AuthenticationSuccessListener({
    super.key,
    ValueChanged<Account>? onAuthenticated,
  }) : super(
          listenWhen: (_, state) => state.maybeWhen<bool>(
            authenticated: (_) => true,
            orElse: () => false,
          ),
          listener: (context, state) {
            state.mapOrNull<void>(
              authenticated: (s) => onAuthenticated?.call(s.account),
            );
          },
        );
}
