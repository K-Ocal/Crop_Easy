import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/create_note_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/progress_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class YourTaskWidget extends StatelessWidget {
  const YourTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.cropTracker,
          margin: Utils()
              .getMargin(top: marginX10 * Utils.getScalingFactor(context)),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants().png.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        actions: const [
          CustomBackBtnWidget(),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImageWidget(),
          Padding(
            padding: Utils().getPadding(
              left: paddingX26 * Utils.getScalingFactor(context),
              right: paddingX26 * Utils.getScalingFactor(context),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: Utils().getPadding(
                        bottom: sizeX26 * Utils.getScalingFactor(context)),
                    child: Column(
                      children: [
                        Text(
                          "Your Task",
                          style: CropEasyTheme.getTextTheme(context)
                              .headingMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: sizeX50 * Utils.getScalingFactor(context)),
                        CustomButton(
                            buttonStyle: CustomButtonStyles.addTopBtnStyle,
                            buttonTextStyle: CropEasyTheme.getTextTheme(context)
                                .bodyTextLarge,
                            text: "Water Tomatoes"),
                        SizedBox(
                            height: sizeX20 * Utils.getScalingFactor(context)),
                        particularBarContent(context, cropList[0]),
                        CustomButton(
                            buttonTextStyle: CropEasyTheme.getTextTheme(context)
                                .bodyTextLarge,
                            buttonStyle: CustomButtonStyles.addTopBtnStyle,
                            text: "Water Tomatoes"),
                        SizedBox(
                            height: sizeX20 * Utils.getScalingFactor(context)),
                        particularBarContent(context, cropList[1]),
                        CustomButton(
                            buttonTextStyle: CropEasyTheme.getTextTheme(context)
                                .bodyTextLarge,
                            buttonStyle: CustomButtonStyles.addTopBtnStyle,
                            text: "Water Tomatoes"),
                        SizedBox(
                            height: sizeX20 * Utils.getScalingFactor(context)),
                        particularBarContent(context, cropList[1]),
                        Text(
                          "Upcoming Tasks",
                          style: CropEasyTheme.getTextTheme(context)
                              .bodyTextLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: sizeX30 * Utils.getScalingFactor(context),
                        ),
                        CustomButton(
                            onPressed: () {
                              // Navigation.pushNewRoute(context, const CreateTaskWidget());
                            },
                            height: sizeX48 * Utils.getScalingFactor(context),
                            width: sizeX200 * Utils.getScalingFactor(context),
                            buttonStyle: CustomButtonStyles.fillBlueGray,
                            text: "Water Tomatoes"),
                            SizedBox(
                          height: sizeX20 * Utils.getScalingFactor(context),
                        ),
                            CustomButton(
                            onPressed: () {
                              Navigation.pushNewRoute(context, const CreateNoteWidget());
                            },
                            height: sizeX48 * Utils.getScalingFactor(context),
                            width: sizeX200 * Utils.getScalingFactor(context),
                            buttonStyle: CustomButtonStyles.fillBlueGray,
                            text: "Add Note"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget particularBarContent(BuildContext context, CropModel cropModel) {
    return Padding(
      padding: Utils()
          .getPadding(bottom: paddingX20 * Utils.getScalingFactor(context)),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 26 * Utils.getScalingFactor(context),
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
                    tickPosition: LinearElementPosition.outside,
                    animateRange: true,
                    animateAxis: true,
                    ranges: [
                      LinearGaugeRange(
                        startValue: 0,
                        endValue: 100,
                        color: AppColors.transparent,
                        rangeShapeType: LinearRangeShapeType.curve,
                        endWidth: 26 * Utils.getScalingFactor(context),
                        position: LinearElementPosition.cross,
                        child: Container(
                          height: 26 * Utils.getScalingFactor(context),
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
                        thickness: 26 *
                            Utils.getScalingFactor(context), // Pointer height
                        position: LinearElementPosition.cross,
                        edgeStyle: LinearEdgeStyle.startCurve,
                        child: Container(
                          height: 26 * Utils.getScalingFactor(context),
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
                      thickness: 26 * Utils.getScalingFactor(context),
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
