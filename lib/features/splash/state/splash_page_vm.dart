import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/onboarding/ui/onboarding_page.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/user_roles.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';

class SplashPageVM {
  void setGlobalUserRole({required BuildContext context,required UserRoles role}) async{
   await AppStorage.setStringPrefs(
      key: ConfigStrings.globalUserRole,
      value: role.jsonString,
    );

   if(context.mounted){
     context.pushSuper(OnboardingPage());
   }
  }
}
