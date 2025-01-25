import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.about,
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
                  SizedBox(height: sizeX100 * Utils.getScalingFactor(context)),
                  Text(
                    "CropEasy is a smart crop management app that helps farmers and gardeners organize, track, and optimize their crop care routines. With task reminders, progress tracking, and seasonal suggestions, it simplifies crop management for better yields and efficiency.",
                    style: CropEasyTheme.getTextTheme(context)
                        .bodyTextLarge
                        ?.copyWith(
                          height: 1.6,
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

// 