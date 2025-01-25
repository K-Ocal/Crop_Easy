import 'package:crop_easy/common/top_snack_bar.dart';

import 'dimens.dart';
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import 'enum.dart';

// ignore: deprecated_member_use
MediaQueryData mediaQueryData = MediaQueryData.fromView(ui.window);

const num DESIGN_WIDTH = 375;
const num DESIGN_HEIGHT = 812;
const num DESIGN_STATUS_BAR = 0;

class Utils {
  static double getScalingFactor(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width >= 800) {
      return scalingFactor_800sw;
    } else if (width >= 600) {
      return scalingFactor600sw;
    } else if (width < 600 && width > 320) {
      return scalingFactorDefault;
    } else {
      return scalingFactor_320sw;
    }
  }

  ///This method is used to get device viewport width.
  get width {
    return mediaQueryData.size.width;
  }

  get height {
    return mediaQueryData.size.height;
  }

  ///This method is used to get device viewport height.
  get _height {
    num statusBar = mediaQueryData.viewPadding.top;
    num bottomBar = mediaQueryData.viewPadding.bottom;
    num screenHeight = mediaQueryData.size.height - statusBar - bottomBar;
    return screenHeight;
  }

  ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
  double getHorizontalSize(double px) {
    return ((px * width) / DESIGN_WIDTH);
  }

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  double getVerticalSize(double px) {
    return ((px * _height) / (DESIGN_HEIGHT - DESIGN_STATUS_BAR));
  }

  ///This method is used to set padding responsively
  EdgeInsets getPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  ///This method is used to set margin responsively
  EdgeInsets getMargin({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  ///This method is used to get padding or margin responsively
  EdgeInsets getMarginOrPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      left = all;
      top = all;
      right = all;
      bottom = all;
    }
    return EdgeInsets.only(
      left: getHorizontalSize(
        left ?? 0,
      ),
      top: getVerticalSize(
        top ?? 0,
      ),
      right: getHorizontalSize(
        right ?? 0,
      ),
      bottom: getVerticalSize(
        bottom ?? 0,
      ),
    );
  }

  static getShimmmerBaseColor(BuildContext context) {
    return Colors.grey[300];
  }

  static getShimmerHighlightColor(BuildContext context) {
    return Colors.grey[200];
  }

  showSnackBar(BuildContext context, MsgType msgType, String message) {
    showTopSnackBar(
      Overlay.of(context),
      msgType == MsgType.error
          ? CustomSnackBar.error(message: message)
          : CustomSnackBar.success(message: message),
    );
  }
}
