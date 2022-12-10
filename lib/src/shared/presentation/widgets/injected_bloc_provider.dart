import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/di/inject.dart';

class InjectedBlocProvider<B extends BlocBase<Object>> extends BlocProvider<B> {
  InjectedBlocProvider({
    super.key,
    ValueChanged<B>? onCreate,
    Widget? child,
  }) : super(
          create: (context) {
            final bloc = inject<B>();
            onCreate?.call(bloc);
            return bloc;
          },
          child: child,
        );
}
