import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';

class AppLockListener extends BlocListener<AppLockCubit, AppLockState> {
  AppLockListener({
    super.key,
    Widget? child,
    BlocWidgetListener<AppLockState>? listener,
  }) : super(
          child: child,
          listener: (context, state) => state.maybeWhen(
            authenticated: () {
              return null;
            },
            orElse: context.read<AppLockCubit>().authenticate,
          ),
        );
}
