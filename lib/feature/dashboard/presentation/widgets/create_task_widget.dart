import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/your_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateTaskWidget extends StatelessWidget {
  const CreateTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.createTask,
          margin: Utils()
              .getMargin(top: marginX16 * Utils.getScalingFactor(context)),
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
                          "Select Date",
                          style: CropEasyTheme.getTextTheme(context)
                              .headingMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: sizeX30 * Utils.getScalingFactor(context)),
                        _dateWidget(context),
                        SizedBox(
                            height: sizeX40 * Utils.getScalingFactor(context)),
                        CustomButton(
                            onPressed: () {
                              Navigation.push(context, const YourTaskWidget());
                            },
                            buttonStyle: CustomButtonStyles.addTopBtnStyle,
                            buttonTextStyle: CropEasyTheme.getTextTheme(context)
                                .bodyTextLarge,
                            text: "Select Task Type"),
                        SizedBox(
                            height: sizeX16 * Utils.getScalingFactor(context)),
                        CustomButton(
                            buttonTextStyle: CropEasyTheme.getTextTheme(context)
                                .bodyTextLarge,
                            buttonStyle: CustomButtonStyles.addTopBtnStyle,
                            text: "Set Reminder Time"),
                        SizedBox(
                            height: sizeX40 * Utils.getScalingFactor(context)),
                        _btnWidget(context)
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

  _btnWidget(BuildContext context) {
    return CustomButton(
        onPressed: () {
          // Navigation.pushNewRoute(context, const CreateTaskWidget());
        },
        height: sizeX48 * Utils.getScalingFactor(context),
        width: sizeX200 * Utils.getScalingFactor(context),
        buttonStyle: CustomButtonStyles.fillBlueGray,
        text: "Add task");
  }

  _dateWidget(BuildContext context) {
    return Container(
      padding: Utils().getPadding(
          // top: paddingX10 * Utils.getScalingFactor(context),
          // left: paddingX10 * Utils.getScalingFactor(context),
          // right: paddingX10 * Utils.getScalingFactor(context),
          ),
      child: SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.range,
        view: DateRangePickerView.month,
        navigationDirection: DateRangePickerNavigationDirection.horizontal,
        enableMultiView: false,
        showNavigationArrow: true,
        initialDisplayDate: DateTime.now(),
        onSelectionChanged: onSelectionChanged,
        backgroundColor: AppColors.primary,
        cancelText: "cancel",
        monthCellStyle: DateRangePickerMonthCellStyle(
          textStyle: CropEasyTheme.getTextTheme(context).bodyTextMedium,
        ),
        extendableRangeSelectionDirection:
            ExtendableRangeSelectionDirection.both,
        selectionTextStyle: CropEasyTheme.getTextTheme(context)
            .bodyTextMedium
            ?.copyWith(color: AppColors.accent),
        endRangeSelectionColor: AppColors.black,
        rangeSelectionColor: AppColors.accent.withOpacity(0.5),
        allowViewNavigation: true,
        minDate: DateTime.now(),
        headerStyle: DateRangePickerHeaderStyle(
            textStyle: CropEasyTheme.getTextTheme(context).headingSmall),
      ),
    );
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {}
}
