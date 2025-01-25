import 'package:crop_easy/core/theme/theme.dart';
import 'package:crop_easy/core/utils/colors.dart';
import 'package:crop_easy/core/utils/enum.dart';
import 'package:crop_easy/feature/splash/presentation/splash_page_view.dart';
import 'package:crop_easy/global/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crop_easy/global/configuration.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize();
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStartWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ghum Nepal",
        navigatorKey: navigatorKey,
        themeMode: ThemeMode.light,
        theme: CropEasyTheme.setTheme(context, ThemeState.app_theme_light),
        home: const SplashPageView(),
        localizationsDelegates: const [],
      ),
    );
  }
}
 