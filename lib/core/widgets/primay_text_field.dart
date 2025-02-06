import 'package:chondohealth/gen/assets.gen.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class WTextField extends StatefulWidget {
  final double? width;
  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final bool enabled;
  final bool readOnly;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<FilteringTextInputFormatter>? formatter;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixWidget;
  final bool obsecureText;
  final String? prefixIconPath;
  final bool? isprefixIconPathSvg;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool isBdPhoneNumber;
  const WTextField({
    super.key,
    this.width,
    this.label,
    this.labelStyle,
    this.hintText,
    this.maxLength,
    this.minLength,
    this.maxLines,
    this.keyboardType,
    required this.controller,
    this.formatter,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.enabled = true,
    this.suffixWidget,
    this.validator,
    this.prefixIconPath,
    this.isprefixIconPathSvg = false,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.isBdPhoneNumber = false,
  }) : obsecureText = false;

  const WTextField.obsecureText({
    super.key,
    this.width,
    this.label,
    this.labelStyle,
    this.hintText,
    this.maxLength,
    this.minLength,
    this.maxLines,
    this.keyboardType,
    required this.controller,
    this.formatter,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.enabled = true,
    this.suffixWidget,
    this.validator,
    this.prefixIconPath,
    this.isprefixIconPathSvg,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.isBdPhoneNumber = false,
  }) : obsecureText = true;

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField> {
  late final ValueNotifier<bool> obsecureText = ValueNotifier<bool>(widget.obsecureText);

  late final TextEditingController _internalController;
  late final bool _isInternalController;

  @override
  void initState() {
    super.initState();
    // If controller is not provided, create an internal one
    _isInternalController = widget.controller == null;
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Only dispose if it's an internally created controller
    if (_isInternalController) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: widget.labelStyle ??
                context.themes.textTheme.bodyLarge?.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
        gapY(5),
        ValueListenableBuilder<bool>(
          valueListenable: obsecureText,
          builder: (_, value, __) {
            return SizedBox(
              width: widget.width ?? double.infinity,
              child: TextFormField(
                maxLength: widget.maxLength,
                minLines: widget.minLength,
                maxLines: widget.maxLines ?? 1,
                enabled: widget.enabled,
                validator: widget.validator,
                obscureText: value,
                controller: _internalController,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                onChanged: widget.onChanged,
                keyboardType: widget.keyboardType,
                focusNode: widget.focusNode,
                onFieldSubmitted: widget.onFieldSubmitted,
                inputFormatters: widget.formatter != null ? widget.formatter! : [],
                decoration: InputDecoration(
                  counterText: '',
                  prefixIconConstraints: BoxConstraints(maxHeight: 17.w),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: widget.prefixIconPath == null ? 10.w : 0.0),
                  hintText: widget.hintText ?? (widget.label == null ? "Hint Text" : "Enter ${widget.label}"),
                  prefixIcon: widget.isBdPhoneNumber == true
                      ? Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Wrap(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.logo.bangladesh,
                                height: 24.h,
                                fit: BoxFit.cover,
                              ).gapX,
                              Text(
                                "+880",
                                style: context.themes.textTheme.bodyLarge,
                              ).gapX,
                              Container(
                                height: 20.h,
                                width: 1.w,
                                color: context.themes.textTheme.bodyLarge?.color,
                              ).gapX,
                            ],
                          ),
                        )
                      : widget.prefixIconPath == null
                          ? null
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: widget.isprefixIconPathSvg == true
                                  ? SvgPicture.asset(
                                      widget.prefixIconPath!,
                                    )
                                  : Image.asset(
                                      widget.prefixIconPath!,
                                    ),
                            ),
                  suffixIcon: widget.obsecureText
                      ? InkWell(
                          onTap: () {
                            obsecureText.value = !obsecureText.value;
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: PTheme.spaceX,
                              vertical: PTheme.spaceY,
                            ),
                            child: SvgPicture.asset(
                              obsecureText.value ? Assets.logo.eyeClose : Assets.logo.eyeOpen,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : widget.suffixIcon,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
