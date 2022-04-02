import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.borderColor,
    this.borderRadius,
    this.boxShadow,
    required this.child,
    this.color,
    this.margin,
    this.onTap,
    this.padding,
  }) : super(key: key);
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final BoxShadow? boxShadow;
  final Widget child;
  final Color? color;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(5),
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).backgroundColor,
            border: Border.all(
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(5),
            boxShadow: [
              boxShadow ??
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 10,
                  )
            ],
          ),
          padding: padding ?? const EdgeInsets.all(10),
          child: child,
        ),
      ),
    );
  }
}
