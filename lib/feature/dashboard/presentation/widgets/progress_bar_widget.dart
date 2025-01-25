import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/create_task_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/recommanded_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressbarWidget extends StatelessWidget {
  const ProgressbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Your Crops",
            style: CropEasyTheme.getTextTheme(context)
                .headingMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: sizeX20 * Utils.getScalingFactor(context),
          ),
          _userReviewContentList(context),
          SizedBox(height: sizeX40 * Utils.getScalingFactor(context)),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CustomButton(
                      onPressed: () {
                        Navigation.pushNewRoute(
                            context, const CreateTaskWidget());
                      },
                      height: sizeX48 * Utils.getScalingFactor(context),
                      buttonStyle: CustomButtonStyles.fillBlueGray,
                      text: "Add task")),
              const Expanded(child: SizedBox()),
              Expanded(
                  flex: 2,
                  child: CustomButton(
                      onPressed: () {
                        Navigation.push(context, const RecommandedTaskWidget());
                      },
                      height: sizeX48 * Utils.getScalingFactor(context),
                      buttonStyle: CustomButtonStyles.fillBlueGray,
                      text: "Add crop")),
            ],
          )
        ],
      ),
    );
  }

  _userReviewContentList(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        padding: Utils().getPadding(bottom: 10),
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cropList.length,
        itemBuilder: (context, index) {
          return particularBarContent(context, cropList[index]);
        },
      ),
    );
  }

  Widget particularBarContent(BuildContext context, CropModel cropModel) {
    return Padding(
      padding: Utils()
          .getPadding(bottom: paddingX26 * Utils.getScalingFactor(context)),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 46 * Utils.getScalingFactor(context),
              child: Stack(
                alignment:
                    Alignment.centerLeft, // Center text on the progress bar
                children: [
                  SfLinearGauge(
                    orientation: LinearGaugeOrientation.horizontal,
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    tickPosition: LinearElementPosition.inside,
                    animateRange: true,
                    animateAxis: true,
                    ranges: [
                      LinearGaugeRange(
                        startValue: 0,
                        endValue: 100,
                        color: AppColors.transparent,
                        rangeShapeType: LinearRangeShapeType.curve,
                        endWidth: 46 * Utils.getScalingFactor(context),
                        position: LinearElementPosition.cross,
                        child: Container(
                          height: 46 * Utils.getScalingFactor(context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(
                                radiusX40 * Utils.getScalingFactor(context)),
                          ),
                        ),
                      ),
                    ],
                    barPointers: [
                      LinearBarPointer(
                        value: cropModel.progress.toDouble(),
                        color: AppColors.transparent,
                        thickness: 46 *
                            Utils.getScalingFactor(context), // Pointer height
                        position: LinearElementPosition.cross,
                        edgeStyle: LinearEdgeStyle.bothFlat,
                        child: Container(
                          height: 46 * Utils.getScalingFactor(context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.color9DFF94,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                    interval: 46,
                    minorTicksPerInterval: 1,
                    majorTickStyle: LinearTickStyle(
                      length: sizeX10,
                      thickness: 46 * Utils.getScalingFactor(context),
                    ),
                    minorTickStyle: LinearTickStyle(
                      length: sizeX70,
                      thickness: sizeX12 * Utils.getScalingFactor(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 26 * Utils.getScalingFactor(context)),
                    child: Text(
                      "${cropModel.title} ${cropModel.progress}%",
                      style: CropEasyTheme.getTextTheme(context)
                          .bodyTextMedium
                          ?.copyWith(
                            color: AppColors
                                .black, // Adjust text color for visibility
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class CropModel {
  final String title;
  final int progress;
  CropModel(this.title, this.progress);
}

List<CropModel> cropList = [
  CropModel("Tomatoes", 80),
  CropModel("Potatoes", 46),
  CropModel("Corn", 70),
];
