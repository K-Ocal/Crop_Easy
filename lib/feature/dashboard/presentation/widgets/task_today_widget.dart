import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:flutter/material.dart';

class TaskTodayWidget extends StatelessWidget {
  const TaskTodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          Utils().getPadding(bottom: sizeX26 * Utils.getScalingFactor(context)),
      child: Column(
        children: [
          Text(
            "Tasks for Today",
            style: CropEasyTheme.getTextTheme(context)
                .headingMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: sizeX40 * Utils.getScalingFactor(context),
          ),
          CustomButton(
              buttonStyle: CustomButtonStyles.addTopBtnStyle,
              buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
              text: "Water Tomatoes"),
          SizedBox(height: sizeX16 * Utils.getScalingFactor(context)),
          CustomButton(
             buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
              buttonStyle: CustomButtonStyles.addTopBtnStyle,
              text: "Water Tomatoes"),
        ],
      ),
    );
  }
}
