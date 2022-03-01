import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.backgroundColor = Colors.transparent,
    this.height = 56,
    this.title,
  }) : super(key: key);

  final Color backgroundColor;
  final double height;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
