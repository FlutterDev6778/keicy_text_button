library keicy_text_button;

import 'package:flutter/material.dart';

class KeicyTextButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final TextStyle? textStyle;
  final Color? backColor;
  final Color? primaryColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? bordercolor;
  final double? elevation;
  final FocusNode? focusNode;
  final bool autofocus;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  const KeicyTextButton({
    Key? key,
    @required this.text,
    this.child,
    this.backColor,
    this.primaryColor,
    this.leftWidget,
    this.rightWidget,
    this.textStyle,
    this.width,
    this.height,
    this.bordercolor,
    this.borderRadius,
    this.elevation,
    this.focusNode,
    this.autofocus = false,
    this.onPressed,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? fixedSize;

    if (width != null && height == null) {
      fixedSize = Size.fromWidth(width!);
    } else if (width == null && height != null) {
      fixedSize = Size.fromHeight(height!);
    } else if (width != null && height != null) {
      fixedSize = Size(width!, height!);
    }

    return TextButton(
      style: TextButton.styleFrom(
        primary: primaryColor,
        backgroundColor: backColor,
        fixedSize: fixedSize,
        side: bordercolor != null ? BorderSide(color: bordercolor!) : null,
        shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
        elevation: elevation,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          leftWidget ?? const SizedBox(),
          child ?? Text(text!, style: textStyle),
          rightWidget ?? const SizedBox(),
        ],
      ),
      focusNode: focusNode,
      autofocus: autofocus,
      onPressed: onPressed == null
          ? null
          : () {
              onPressed!();
            },
      onLongPress: onLongPress == null
          ? null
          : () {
              onLongPress!();
            },
    );
  }
}
