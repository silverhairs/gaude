import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';

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
}
