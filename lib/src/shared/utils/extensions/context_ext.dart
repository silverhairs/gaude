import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:gaude/src/features/main/presentation/pages/main_page.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get screenSize => MediaQuery.of(this).size;

  Future<T?> navigateTo<T>(Widget child) => Navigator.push<T>(
        this,
        CupertinoPageRoute(builder: (context) => child),
      );

  Future<T?> navigateToReplacement<T>(Widget child) async =>
      await Navigator.of(this).pushReplacement<T?, Object>(
        CupertinoPageRoute(builder: (context) => child),
      );

  void popNavigator<T>([T? result]) => Navigator.of(this).pop<T>(result);

  Future<void> showFlushbar(Flushbar flushbar) async =>
      await flushbar.show(this);

  /// Calls the given function using the [BuildContext] of the [MaterialApp].
  ///
  /// This operation is O(n) where n is the number of ancestor build contexts between [MainPage]
  /// and the current context. Using this method too far away from the [MainPage]
  /// is not recommended.
  T useRoot<T>(T Function(BuildContext rootContext) fn) {
    const widget = MainPage;
    try {
      final root = findAncestorStateOfType<State<MainPage>>()!.context;
      return fn(root);
    } on Exception {
      throw Exception(
        'Could not find the root context, did you call useRoot() from a widget '
        'that is not a descendant of [$widget]? or maybe [$widget] is not the name'
        'of the root widget anymore 🤔',
      );
    }
  }
}
