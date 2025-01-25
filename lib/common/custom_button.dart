import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends BaseButton {
  const CustomButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
  });

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 54.v,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? TextStyle(fontSize: 16.fSize),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  });

  final String text;

  final VoidCallback? onPressed;

  final ButtonStyle? buttonStyle;

  final TextStyle? buttonTextStyle;

  final bool? isDisabled;

  final double? height;

  final double? width;

  final EdgeInsets? margin;

  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorA6C5A3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.h),
        ),
      );
  static ButtonStyle get tryAgain => ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.h),
        ),
      );
  static ButtonStyle get addTopBtnStyle => ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorFDCE25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.h),
        ),
      );
  static ButtonStyle get themeBtnStyle => ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );

  static ButtonStyle get skipBtn => ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.h),
            side: BorderSide(color: AppColors.primary)),
      );

  static ButtonStyle get showAllPicBtn => ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.h),
            side: BorderSide(color: AppColors.primary)),
      );
  static ButtonStyle get cancleBooking => ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.h),
            side: BorderSide(color: AppColors.primary)),
      );
}
