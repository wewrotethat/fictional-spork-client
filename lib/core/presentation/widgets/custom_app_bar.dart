import 'package:flutter/material.dart';

import 'package:fictional_spork/core/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.foregroundColor = AppColors.primaryColor,
    this.height = 56,
    this.leading,
    this.title,
  }) : super(key: key);

  final Color backgroundColor;
  final double elevation;
  final Color foregroundColor;
  final double height;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      foregroundColor: foregroundColor,
      leading: leading,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
