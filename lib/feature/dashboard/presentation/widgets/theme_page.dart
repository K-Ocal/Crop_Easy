import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.themeAppbar,
          margin: Utils().getMargin(top: 16),
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomButton(
              buttonStyle: CustomButtonStyles.themeBtnStyle,
              buttonTextStyle:
                  CropEasyTheme.getTextTheme(context).bodyTextLarge,
              text: "Light Mode"),
          SizedBox(height: sizeX20 * Utils.getScalingFactor(context)),
          CustomButton(
              buttonTextStyle: CropEasyTheme.getTextTheme(context)
                  .bodyTextLarge
                  ?.copyWith(color: AppColors.white),
              buttonStyle: CustomButtonStyles.themeBtnStyle.copyWith(
                  backgroundColor: WidgetStatePropertyAll(AppColors.black)),
              text: "Dark Mode"),
          SizedBox(height: sizeX100 * Utils.getScalingFactor(context)),
        ],
      ),
    );
  }
}
