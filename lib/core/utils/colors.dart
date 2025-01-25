import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xFFf9fafe);
  static Color whiteA700 = const Color(0XFFFEFEFE);
  static Color accent = const Color(0xFFFF5C01);
  static Color accent10 = const Color(0xFFF30000);
  static Color accent12 = const Color(0xFFfad3d5);
  static Color tabActiveColor = const Color(0xFFFF2E2E);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color black38 = Colors.black38;
  static Color black30 = const Color.fromRGBO(0, 0, 0, 0.3);
  static Color black50 = Colors.black54;
  static Color grey = Colors.grey;
  static Color grey200 = Colors.grey.shade200;
  static Color grey100 = Colors.grey.shade100;
  static Color grey400 = Colors.grey.shade400;
  static Color grey600 = Colors.grey.shade600;
  static Color grey500 = Colors.grey.shade500;
  static Color grey800 = Colors.grey.shade800;
  static Color red = const Color(0xFFFF0000);
  static Color transparent = Colors.transparent;
  static Color colorf3f2f5 = const Color(0xfff3f2f5);
  static Color color868686 = const Color(0xff868686);
  static Color color878787 = const Color(0xff878787);
  static Color colorblack54 = const Color(0x8A000000);
  static Color containerColor303030 = const Color(0XFF303030);
  static Color color6A6A6A = const Color(0XFF6A6A6A);
  static Color filterBack = const Color.fromRGBO(0, 0, 0, 0.64);
  static Color startColor = const Color(0xFFFF5C01); // Orange color
  static Color endColor = const Color(0xFFF30000); // Red color
  static Color switchDeactiveColor = const Color(0xFF878787);
  static Color devider = const Color(0xFFE3E3E3);
  static Color lightGrey = const Color.fromARGB(255, 234, 235, 236);
  static Color unselectedTabTextColor = const Color(0xFF9C9C9C);
  static Color greenColor = const Color(0xff2CBF55);
  static const Color borderMedium = Color(0xffD8D8D8);
  static const Color colorF3F3F3 = Color(0xffF3F3F3);
  static const Color color7C7C7C = Color(0xff7C7C7C);
  static const Color color767676 = Color(0xff767676);
  static const Color colorF6F9FE = Color(0xffF6F9FE);
  static const Color color203426 = Color(0xff203426);
  static const Color colorECECEC = Color(0xffECECEC);
  static const Color qrBackground = Color(0xFFfaf3f3);
  static const Color dashboardBgColor = Color(0xfff9fbff);
  static const Color color909090 = Color(0xff909090);
  static const Color colorF2F2F2 = Color(0xffF2F2F2);
  static const Color colorf8faff = Color(0xFFf8faff);
  static const Color color011207 = Color(0xff011207);
  static const Color color191D31 = Color(0xff191D31);
  static const Color color44474F = Color(0xff44474F);
  static const Color color686868 = Color(0xff686868);
  static Color error = const Color(0xFFD31948);
  static Color errorBtnColor = const Color(0xFFFE725F);
  static Color shimmerBaseColor = Colors.grey[300]!;
  static Color color9DFF94 = Color(0xff9DFF94);
  static Color colorA6C5A3 = Color(0xffA6C5A3);
  static Color colorFDCE25 = Color(0xffFDCE25);
  static Color colorD9D9D9 = Color(0xffD9D9D9);
  static Color textBorderColor = const Color(0xffD9D9D9);
  static Color textFieldBgColor = const Color(0xfff2f4ff);
  static Color textFieldHintColor = const Color(0xff626262);


  static Map<int, Color> color = const {
    50: Color.fromRGBO(0, 0, 0, .1),
    100: Color.fromRGBO(0, 0, 0, .2),
    200: Color.fromRGBO(0, 0, 0, .3),
    300: Color.fromRGBO(0, 0, 0, .4),
    400: Color.fromRGBO(0, 0, 0, .5),
    500: Color.fromRGBO(0, 0, 0, .6),
    600: Color.fromRGBO(0, 0, 0, .7),
    700: Color.fromRGBO(0, 0, 0, .8),
    800: Color.fromRGBO(0, 0, 0, .9),
    900: Color.fromRGBO(0, 0, 0, 1)
  };
  static MaterialColor primarySwatch = MaterialColor(0xFF000000, color);

  static LinearGradient btnGradientcolor =
      LinearGradient(colors: [startColor, endColor]);
}
