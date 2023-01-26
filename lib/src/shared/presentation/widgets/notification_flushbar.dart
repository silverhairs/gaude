// ignore_for_file: must_be_immutable

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gaude/src/shared/utils/styling/app_colors.dart';
import 'package:gaude/src/shared/utils/styling/dimens.dart';

class NotificationFlushbar extends Flushbar {
  NotificationFlushbar({
    super.key,
    super.message,
    super.title,
    bool isError = true,
  }) : super(
          duration: activeDuration,
          animationDuration: kThemeAnimationDuration,
          backgroundColor: isError ? AppColors.red20 : AppColors.green20,
          messageColor: isError ? AppColors.red80 : AppColors.dark60,
          titleColor: isError ? AppColors.red80 : AppColors.dark60,
          flushbarPosition: FlushbarPosition.TOP,
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          margin: const EdgeInsets.all(Dimens.outerPadding),
          padding: const EdgeInsets.all(Dimens.outerPadding),
        );

  static const Duration activeDuration = Duration(seconds: 3);
}
