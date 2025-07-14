import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/auth/log_in/ui/login_page.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_notifier.dart';
import 'package:nest_loop_mobile/features/splash/state/splash_page_vm.dart';
import 'package:nest_loop_mobile/features/splash/ui/landing_page.dart';
import 'package:nest_loop_mobile/features/splash/widgets/role_selector_tile.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
   initNavigation();
  }

  void initNavigation() async{
    bool toLogin = await AppStorage.getBoolPref(ConfigStrings.skipOnboarding);
    if(toLogin){
      context.pushAndPopAllSuper(LoginPage());
      return;
    }
    context.pushAndPopAllSuper(LandingPage());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Container(
        color: AppColors.baseBackground,
      ),
    );
  }
}
