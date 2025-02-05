import 'package:chondohealth/core/functions/unfocus.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WPrimaryButton extends StatefulWidget {
  final String? text;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final bool border;
  final Color? color;
  final List<Color>? gradientColors;
  final bool? isDisabled;
  const WPrimaryButton({
    super.key,
    this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.gradientColors,
    this.isDisabled,
  }) : border = false;
  const WPrimaryButton.border({
    super.key,
    required this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.gradientColors,
    this.isDisabled,
  }) : border = true;

  @override
  WPrimaryButtonState createState() => WPrimaryButtonState();
}

class WPrimaryButtonState extends State<WPrimaryButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        unFocus();
        widget.onTap?.call();
      },
      child: Container(
        height: widget.height ?? PTheme.fieldHeight,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PTheme.boarderRadius),
          border: widget.border
              ? Border.all(
                  color: widget.color ?? context.themes.buttonTheme.colorScheme!.primary,
                )
              : null,
          gradient: widget.border
              ? null
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: widget.gradientColors ??
                      [
                        _isPressed
                            ? context.themes.buttonTheme.colorScheme!.primary
                            : context.themes.buttonTheme.colorScheme!.tertiary,
                        _isPressed
                            ? context.themes.buttonTheme.colorScheme!.tertiary
                            : context.themes.buttonTheme.colorScheme!.primary,
                      ],
                ),
        ),
        child: Center(
          child: Text(
            widget.text ?? "Primary Button",
            style: context.themes.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
