import 'package:crop_easy/common/custom_button.dart';
import 'package:crop_easy/common/custom_text_field.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/enum.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/view/dashboard_page_view.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  AuthType authType = AuthType.signin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImageWidget(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: Utils().getPadding(
        left: paddingX26 * Utils.getScalingFactor(context),
        right: paddingX26 * Utils.getScalingFactor(context),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildFormHeader(context),
            _buildFormFields(context),
            _buildFormFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormHeader(BuildContext context) {
    return Padding(
      padding:
          Utils().getPadding(bottom: sizeX26 * Utils.getScalingFactor(context)),
      child: Text(
        authType == AuthType.signin ? "Sign In" : "Sign Up",
        style: CropEasyTheme.getTextTheme(context)
            .headingMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return Column(
      children: [
        if (authType == AuthType.signup)
          CustomTextFormField(
            autofocus: false,
            controller: fullNameController,
            hintText: "Full Name",
            hintStyle: CropEasyTheme.getTextTheme(context).bodyTextMedium,
          ),
        SizedBox(height: sizeX10 * Utils.getScalingFactor(context)),
        CustomTextFormField(
          autofocus: false,
          controller: emailController,
          hintText: "Email",
          hintStyle: CropEasyTheme.getTextTheme(context).bodyTextMedium,
        ),
        SizedBox(height: sizeX10 * Utils.getScalingFactor(context)),
        CustomTextFormField(
          autofocus: false,
          controller: passwordController,
          hintText: "Password",
          obscureText: true,
          hintStyle: CropEasyTheme.getTextTheme(context).bodyTextMedium,
        ),
        SizedBox(height: sizeX30 * Utils.getScalingFactor(context)),
      ],
    );
  }

  Widget _buildFormFooter() {
    return Column(
      children: [
        CustomButton(
          onPressed: (){
            Navigation.replace(context, DashboardPageView());
          },
          buttonTextStyle: CropEasyTheme.getTextTheme(context).bodyTextLarge,
          buttonStyle: CustomButtonStyles.addTopBtnStyle,
          text: authType == AuthType.signin ? "Sign In" : "Sign Up",
        ),
        SizedBox(height: sizeX16 * Utils.getScalingFactor(context)),
        TextButton(
          onPressed: () {
            setState(() {
              authType = authType == AuthType.signin
                  ? AuthType.signup
                  : AuthType.signin;
            });
          },
          child: Text(
            authType == AuthType.signin
                ? "Don't have an account? Sign Up"
                : "Already have an account? Sign In",
          ),
        ),
      ],
    );
  }
}
