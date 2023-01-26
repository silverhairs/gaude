import 'package:flutter/material.dart';
import 'package:gaude/src/shared/utils/extensions/context_ext.dart';

/// {@template root_context_builder}
/// A [Builder] that uses the root [BuildContext] instead of the current one.
/// {@endtemplate}
class RootContextBuilder extends Builder {
  /// {@macro root_context_builder}
  RootContextBuilder({
    super.key,
    required WidgetBuilder builder,
  }) : super(builder: (context) => context.useRoot(builder));
}
