import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/home/state/home_model.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/user/user_api.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';

final homeNotifier = NotifierProvider<HomeNotifier, HomeModel>(() {
  return HomeNotifier();
});

class HomeNotifier extends Notifier<HomeModel>{
  @override
  HomeModel build() => HomeModel();

  Future<void> getUserData(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(
        ConfigStrings.authToken,
      );

      final response = await UserApi.getUserData(
        authToken: authToken,
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        state = state.copyWith(userResponse: ()=> response.data);

        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

}