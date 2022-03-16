import 'package:flutter/material.dart';

import 'package:fictional_spork/core/theme/theme.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.icon,
    this.onTap,
    this.splashColor,
    this.width,
  }) : super(key: key);

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? height;
  final Icon? icon;
  final VoidCallback? onTap;
  final Color? splashColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      child: Material(
        color: backgroundColor ?? AppColors.primaryColorLight,
        child: InkWell(
          onTap: onTap,
          splashColor: splashColor ?? AppColors.primaryColor.withOpacity(0.4),
          child: SizedBox(
            height: height ?? 35,
            width: width ?? 35,
            child: icon,
          ),
        ),
      ),
    );
  }
}
