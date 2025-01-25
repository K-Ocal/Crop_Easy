 import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:flutter/material.dart';

class RecommandedTaskWidget extends StatelessWidget {
  const RecommandedTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.suggestion,
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
        alignment: Alignment.topCenter,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: Utils().getPadding(
                      top: sizeX26 * Utils.getScalingFactor(context),
                      bottom: sizeX26 * Utils.getScalingFactor(context),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Recommended Task",
                          style: CropEasyTheme.getTextTheme(context)
                              .headingMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: sizeX50 * Utils.getScalingFactor(context)),
                        GridView.builder(
                          itemCount: taskList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            mainAxisSpacing:
                                30 * Utils.getScalingFactor(context),
                            crossAxisSpacing:
                                30 * Utils.getScalingFactor(context),
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: Utils().getPadding(all: 8),
                              height:
                                  sizeX300 * Utils.getScalingFactor(context),
                              decoration: BoxDecoration(
                                  color: AppColors.colorFDCE25,
                                  borderRadius: BorderRadius.circular(
                                      radiusX10 *
                                          Utils.getScalingFactor(context))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    taskList[index].title,
                                    style: CropEasyTheme.getTextTheme(context)
                                        .bodyTextLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  // SizedBox(
                                  //     height: sizeX4 *
                                  //         Utils.getScalingFactor(context)),
                                  CustomImageView(
                                    imagePath: taskList[index].image,
                                    height:
                                        60 * Utils.getScalingFactor(context),
                                    // width: 50,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                      height: sizeX10 *
                                          Utils.getScalingFactor(context)),
                                  Expanded(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      taskList[index].desc,
                                      style: CropEasyTheme.getTextTheme(context)
                                          .bodyTextSmall,
                                    ),
                                  ),
                                  //  SizedBox(
                                  //     height: sizeX10 *
                                  //         Utils.getScalingFactor(context)),
                                ],
                              ),
                            );
                          },
                        )
                        // CustomButton(
                        //     buttonStyle: CustomButtonStyles.addTopBtnStyle,
                        //     buttonTextStyle: CropEasyTheme.getTextTheme(context)
                        //         .bodyTextLarge,
                        //     text: "Water Tomatoes"),
                        // SizedBox(
                        //     height: sizeX20 * Utils.getScalingFactor(context)),
                        // // particularBarContent(context, cropList[0]),
                        // CustomButton(
                        //     buttonTextStyle: CropEasyTheme.getTextTheme(context)
                        //         .bodyTextLarge,
                        //     buttonStyle: CustomButtonStyles.addTopBtnStyle,
                        //     text: "Water Tomatoes"),
                        // SizedBox(
                        //     height: sizeX20 * Utils.getScalingFactor(context)),
                        // // particularBarContent(context, cropList[1]),
                        // CustomButton(
                        //     buttonTextStyle: CropEasyTheme.getTextTheme(context)
                        //         .bodyTextLarge,
                        //     buttonStyle: CustomButtonStyles.addTopBtnStyle,
                        //     text: "Water Tomatoes"),
                        // SizedBox(
                        //     height: sizeX20 * Utils.getScalingFactor(context)),
                        // // particularBarContent(context, cropList[1]),
                        // Text(
                        //   "Upcoming Tasks",
                        //   style: CropEasyTheme.getTextTheme(context)
                        //       .bodyTextLarge
                        //       ?.copyWith(fontWeight: FontWeight.w600),
                        // ),
                        // SizedBox(
                        //   height: sizeX30 * Utils.getScalingFactor(context),
                        // ),
                        // CustomButton(
                        //     onPressed: () {
                        //       // Navigation.pushNewRoute(context, const CreateTaskWidget());
                        //     },
                        //     height: sizeX48 * Utils.getScalingFactor(context),
                        //     width: sizeX200 * Utils.getScalingFactor(context),
                        //     buttonStyle: CustomButtonStyles.fillBlueGray,
                        //     text: "Water Tomatoes"),
                        // SizedBox(
                        //   height: sizeX20 * Utils.getScalingFactor(context),
                        // ),
                        // CustomButton(
                        //     onPressed: () {},
                        //     height: sizeX48 * Utils.getScalingFactor(context),
                        //     width: sizeX200 * Utils.getScalingFactor(context),
                        //     buttonStyle: CustomButtonStyles.fillBlueGray,
                        //     text: "Add Note"),
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
}

final class TaskModel {
  final String image;
  final String title;
  final String desc;
  TaskModel(this.image, this.title, this.desc);
}

List<TaskModel> taskList = [
  TaskModel(ImageConstants().png.tomato, "Tomatoes", "Water every 3 days"),
  TaskModel(
      ImageConstants().png.potato, "Potatoes", "Fertilize every 2-4 weeks"),
  TaskModel(ImageConstants().png.corn, "Tomatoes",
      "Water between 0.15 and 0.20 inches per day"),
];
