import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/about_app_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/notification_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/theme_page.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Menu",
        //     style:
        //         CropEasyTheme.getTextTheme(context).headingMedium?.copyWith()),
        title: CustomImageView(
          imagePath: ImageConstants().png.menu,
          margin: Utils().getMargin(top: 16),
        ),
        centerTitle: true,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomButton(
            onPressed: () {
              Navigation.push(context, const ThemePage());
            },
            rightIcon: CustomImageView(
              imagePath: ImageConstants().png.theme,
              margin: Utils()
                  .getMargin(left: marginX10 * Utils.getScalingFactor(context)),
              height: sizeX26 * Utils.getScalingFactor(context),
            ),
            buttonStyle: CustomButtonStyles.addTopBtnStyle,
            buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
            text: "Change App Theme"),
        SizedBox(height: sizeX20 * Utils.getScalingFactor(context)),
        CustomButton(
            onPressed: () {
              Navigation.push(context, const NotificationPage());
            },
            rightIcon: CustomImageView(
              imagePath: ImageConstants().png.bell,
              margin: Utils()
                  .getMargin(left: marginX10 * Utils.getScalingFactor(context)),
              height: sizeX26 * Utils.getScalingFactor(context),
            ),
            buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
            buttonStyle: CustomButtonStyles.addTopBtnStyle,
            text: "Notifications"),
        SizedBox(height: sizeX20 * Utils.getScalingFactor(context)),
        CustomButton(
            onPressed: () => Navigation.push(context, const AboutAppPage()),
            rightIcon: Padding(
              padding: Utils().getPadding(
                  left: marginX10 * Utils.getScalingFactor(context)),
              child: Icon(Icons.info, color: AppColors.black),
            ),
            buttonStyle: CustomButtonStyles.addTopBtnStyle,
            buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
            text: "About App"),
        SizedBox(height: sizeX20 * Utils.getScalingFactor(context)),
        CustomButton(
            rightIcon: Padding(
              padding: Utils().getPadding(
                  left: marginX10 * Utils.getScalingFactor(context)),
              child: Icon(Icons.logout, color: AppColors.black),
            ),
            buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
            buttonStyle: CustomButtonStyles.addTopBtnStyle,
            text: "Log Out"),
        SizedBox(height: sizeX20 * Utils.getScalingFactor(context)),
      ],
    );
  }
}
