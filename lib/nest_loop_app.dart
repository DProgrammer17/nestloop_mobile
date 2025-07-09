import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/theme/global_app_bar_theme.dart';
import 'package:nest_loop_mobile/features/onboarding/ui/onboarding_page.dart';
import 'package:nest_loop_mobile/features/splash/ui/splash_page.dart';

class NestLoopApp extends StatelessWidget{
  const NestLoopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppConstants.designWidth, AppConstants.designHeight),
      splitScreenMode: true,
      minTextAdapt: false,
      builder: (_, child){
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: true,
          ),
          child: MaterialApp(
            title: AppStrings.appName,
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: AppColors.primaryOrange,
              scaffoldBackgroundColor: AppColors.baseBackground,
              appBarTheme: globalAppBarTheme,
            ),
            debugShowCheckedModeBanner: false,
            home: const OnboardingPage(),
          ),
        );
      },
    );
  }

}