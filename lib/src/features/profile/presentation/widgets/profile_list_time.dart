import 'package:flutter/material.dart';
import 'package:gaude/src/shared/shared.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.color = AppColors.violet,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(Dimens.outerPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.radiusButton),
              color: color.withAlpha(50)),
          child: Icon(icon, color: color),
        ),
      ),
      title: Text(title),
    );
  }
}
