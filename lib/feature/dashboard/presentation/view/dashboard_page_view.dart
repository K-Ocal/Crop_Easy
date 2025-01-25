import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/menu_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/progress_bar_widget.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/task_today_widget.dart';
import 'package:flutter/material.dart';

class DashboardPageView extends StatelessWidget {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: CustomImageView(
          margin:
              Utils().getMargin(top: sizeX10 * Utils.getScalingFactor(context)),
          height: sizeX60 * Utils.getScalingFactor(context),
          imagePath: ImageConstants().png.logoImage,
          fit: BoxFit.cover,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigation.push(context, const MenuWidget());
            },
            child: Padding(
              padding: Utils().getPadding(
                  right: paddingX20 * Utils.getScalingFactor(context)),
              child: const Icon(Icons.menu),
            ),
          ),
        ],
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
                children: [TaskTodayWidget(), ProgressbarWidget()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstants().png.backgroundImage,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
