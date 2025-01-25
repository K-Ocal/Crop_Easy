import 'package:crop_easy/common/custom_image_view.dart';
import 'package:crop_easy/core/navigation/navigation.dart';
import 'package:crop_easy/core/utils/dimens.dart';
import 'package:crop_easy/core/utils/image_constants.dart';
import 'package:crop_easy/core/utils/utils.dart';
import 'package:crop_easy/feature/dashboard/presentation/widgets/auth_page.dart';
import 'package:crop_easy/feature/splash/bloc/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().initializeSplash();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller!)
      ..addListener(() => setState(() {}));
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, bool>(
        listener: (context, splashState) {
          if (splashState) {
            Navigation.replace(context, AuthPage());
          }
        },
        builder: (context, state) {
          return Center(
            child: Transform.scale(
              scale: _animation!.value * 1.1,
              child: CustomImageView(
                width: sizeX200 * Utils.getScalingFactor(context),
                imagePath: ImageConstants().png.logoImage,
                fit: BoxFit.contain,
                height: sizeX200 * Utils.getScalingFactor(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
