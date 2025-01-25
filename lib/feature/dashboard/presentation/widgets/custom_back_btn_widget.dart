import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBackBtnWidget extends StatelessWidget {
  const CustomBackBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigation.pop(context),
      child: Container(
        height: sizeX80 * Utils.getScalingFactor(context),
        width: sizeX60 * Utils.getScalingFactor(context),
        decoration: BoxDecoration(
            color: AppColors.grey100.withOpacity(0.7),
            borderRadius: BorderRadius.circular(
                radiusX10 * Utils.getScalingFactor(context))),
        margin: Utils().getMargin(
            right: marginX20 * Utils.getScalingFactor(context),
            top: sizeX6 * Utils.getScalingFactor(context),
            bottom: sizeX6 * Utils.getScalingFactor(context)),
        child: Padding(
          padding: Utils().getPadding(left: paddingX10),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
