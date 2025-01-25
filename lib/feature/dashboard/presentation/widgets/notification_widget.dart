import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.notification,
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
            child: const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [MenuListWidget()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuListWidget extends StatelessWidget {
  const MenuListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils()
          .getMargin(bottom: marginX50 * Utils.getScalingFactor(context)),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return Container(
            height: sizeX40 * Utils.getScalingFactor(context),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    radiusX10 * Utils.getScalingFactor(context)),
                color: AppColors.colorFDCE25),
            margin: Utils()
                .getMargin(bottom: marginX26 * Utils.getScalingFactor(context)),
            child: Center(
              child: Padding(
                padding: Utils().getPadding(
                    left: paddingX20 * Utils.getScalingFactor(context)),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.justify,
                      reminders[index],
                      style: CropEasyTheme.getTextTheme(context).bodyTextLarge,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> reminders = [
  "Task Reminders",
  "Crop Updates",
  "Seasonal Suggestions"
];
