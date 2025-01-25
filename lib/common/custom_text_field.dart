
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.autovalidateMode,
    this.onFieldSubmitted,
    this.isLightTheme,
    this.readOnly,
    this.onChanged,
    this.onTap,
    this.margin,
  });

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;
  final bool? readOnly;
  final bool? isLightTheme;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final EdgeInsets? margin;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
        width: width ?? double.maxFinite,
        margin: margin,
        child: TextFormField(
            cursorColor: AppColors.textFieldHintColor,
            onTap: onTap,
            onChanged: onChanged,
            controller: controller,
            focusNode: focusNode ?? FocusNode(),
            autofocus: autofocus!,
            style: textStyle,
            obscureText: obscureText!,
            textInputAction: textInputAction,
            keyboardType: textInputType,
            maxLines: maxLines ?? 1,
            decoration: decoration,
            readOnly: readOnly ?? false,
            validator: validator,
            autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
            onFieldSubmitted: onFieldSubmitted),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? TextStyle(color: AppColors.accent),
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(19.h),
        fillColor: fillColor?? AppColors.textFieldBgColor,
        filled: filled,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusX10.h),
            borderSide: BorderSide(color: AppColors.textBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusX10.h),
            borderSide: BorderSide(color: AppColors.accent)),
        border: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusX10.h),
                borderSide:
                    BorderSide(color: AppColors.textBorderColor, width: 2)),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusX10.h),
                borderSide: BorderSide(color: AppColors.textBorderColor)),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusX10.h),
              borderSide: BorderSide(color: AppColors.textBorderColor),
            ),
      );
}


// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField(
//       {super.key,
//       this.alignment,
//       this.width,
//       this.controller,
//       this.focusNode,
//       this.autofocus = true,
//       this.textStyle,
//       this.obscureText = false,
//       this.textInputAction = TextInputAction.next,
//       this.textInputType = TextInputType.text,
//       this.maxLines,
//       this.hintText,
//       this.hintStyle,
//       this.prefix,
//       this.prefixConstraints,
//       this.suffix,
//       this.suffixConstraints,
//       this.contentPadding,
//       this.borderDecoration,
//       this.fillColor,
//       this.filled = true,
//       this.validator,
//       this.autovalidateMode,
//       this.onFieldSubmitted,
//       this.readOnly,
//       this.labelText,
//       this.labelStyle,
//       this.onTap,
//       this.onChanged,
//       this.height,
//       this.alignLabelWithHint,
//       this.cursorHeight,
//       this.characterLimit,
//       this.margin});

//   final Alignment? alignment;

//   final double? width;
//   final double? height;
//   final double? cursorHeight;
//   final int? characterLimit;

//   final TextEditingController? controller;

//   final FocusNode? focusNode;

//   final bool? autofocus;

//   final TextStyle? textStyle;

//   final bool? obscureText;
//   final bool? alignLabelWithHint;
//   final TextInputAction? textInputAction;

//   final TextInputType? textInputType;

//   final int? maxLines;

//   final String? hintText;

//   final TextStyle? hintStyle;

//   final String? labelText;
//   final TextStyle? labelStyle;

//   final Widget? prefix;

//   final BoxConstraints? prefixConstraints;

//   final Widget? suffix;

//   final BoxConstraints? suffixConstraints;

//   final EdgeInsets? contentPadding;
//   final EdgeInsets? margin;

//   final InputBorder? borderDecoration;

//   final Color? fillColor;

//   final bool? filled;
//   final bool? readOnly;
//   final AutovalidateMode? autovalidateMode;
//   final FormFieldValidator<String>? validator;
//   final VoidCallback? onTap;
//   final Function(String)? onChanged;
//   final Function(String)? onFieldSubmitted;
//   @override
//   Widget build(BuildContext context) {
//     return alignment != null
//         ? Align(
//             alignment: alignment ?? Alignment.center,
//             child: textFormFieldWidget,
//           )
//         : textFormFieldWidget;
//   }

//   Widget get textFormFieldWidget => Container(
//         width: width ?? double.maxFinite,
//         height: height ?? sizeX60.v,
//          margin: margin ?? Utils().getMargin(bottom: marginX8.v),
//         child: TextFormField(
//             cursorColor: AppColors.grey,
//             cursorHeight: cursorHeight,
//             controller: controller,
//             focusNode: focusNode ?? FocusNode(),
//             autofocus: autofocus?? false,
//             style: textStyle, //?? CustomTextStyles.bodyMediumBluegray100,
//             obscureText: obscureText!,
//             textInputAction: textInputAction,
//             keyboardType: textInputType,
//             maxLines: maxLines ?? 1,
//             decoration: decoration,
//             readOnly: readOnly ?? false,
//             validator: validator,
//             autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
//             onTap: onTap,
            
//             onChanged: onChanged,
//             inputFormatters: [
//               LengthLimitingTextInputFormatter(characterLimit),
//             ],
//             onFieldSubmitted: onFieldSubmitted),
//       );
//   InputDecoration get decoration => InputDecoration(
//         hintText: hintText ?? "",
//         hintStyle: hintStyle,
//         prefixIcon: prefix,
//         prefixIconConstraints: prefixConstraints,
//         suffixIcon: suffix,
//         suffixIconConstraints: suffixConstraints,
//         isDense: true,
//         contentPadding: contentPadding ?? EdgeInsets.all(paddingX18.h),
//         fillColor: fillColor ?? AppColors.textFieldBgColor,
//         filled: filled,
//         alignLabelWithHint: alignLabelWithHint??true,
//         errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(radiusX10.h),
//                 borderSide: BorderSide(color: AppColors.accent)),
//         border: borderDecoration ??
//             OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(radiusX10.h),
//                 borderSide: BorderSide(color: AppColors.textBorderColor)),
//         enabledBorder: borderDecoration ??
//             OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(radiusX10.h),
//                 borderSide: BorderSide(color: AppColors.textBorderColor)),
//         focusedBorder: borderDecoration ??
//             OutlineInputBorder(
//               borderRadius: BorderRadius.circular(radiusX10.h),
//               borderSide: BorderSide(color: AppColors.textBorderColor),
//             ),
//       );
// }
