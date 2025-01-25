import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/custom_back_btn_widget.dart';
import 'package:flutter/material.dart';

class CreateNoteWidget extends StatelessWidget {
  const CreateNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomImageView(
          imagePath: ImageConstants().png.note,
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
      body: NotepadScreen(),
    );
  }
}

class NotepadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Notepad',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                maxLines: null,
                buildCounter: (context,
                    {required currentLength,
                    required isFocused,
                    required maxLength}) {
                  return Divider();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your notes here...',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          ),
          CustomButton(
              width: sizeX200 * Utils.getScalingFactor(context),
              buttonStyle: CustomButtonStyles.fillBlueGray,
              buttonTextStyle: CropEasyTheme.getTextTheme(context)
                  .bodyTextLarge
                  ?.copyWith(color: AppColors.white),
              text: "Save Note"),
          SizedBox(
            height: sizeX60 * Utils.getScalingFactor(context),
          )
        ],
      ),
    );
  }
}
