import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_model.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_invitation_sent.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/carer/carer_api.dart';
import 'package:nest_loop_mobile/network/api/carer/request/get_carer_query.dart';
import 'package:nest_loop_mobile/network/api/carer/request/post_carer_invite_request.dart';
import 'package:nest_loop_mobile/network/api/carer/response/care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/permissions/permissions_handler.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dialogs/app_platform_date_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final addCarerNotifier = NotifierProvider<AddCarerNotifier, AddCarerModel>(() {
  return AddCarerNotifier();
});

class AddCarerNotifier extends Notifier<AddCarerModel> {
  @override
  AddCarerModel build() => AddCarerModel(
    carerPageController: PageController(),
    carerNameController: TextEditingController(),
    personalMessageController: TextEditingController(),
  );

  void updatePage(int page) => state = state.copyWith(carerCurrentPage: page);

  void updateTimeOption({
    required BuildContext context,
    required String time,
  }) async {
    state = state.copyWith(quickTimeSelection: time);
    switch (time) {
      case AppStrings.oneDay:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addDays(1),
        );
        return;

      case AppStrings.oneWeek:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addWeeks(1),
        );
        return;

      case AppStrings.oneMonth:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addMonths(1),
        );
        return;

      case AppStrings.threeMonth:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addMonths(3),
        );
        return;

      case AppStrings.sixMonth:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addMonths(6),
        );
        return;

      case AppStrings.custom:
        final result = await showPlatformDatePicker(context);
        state = state.copyWith(selectedTimeDuration: () => result);
        return;
    }
  }

  void selectorUpdateAccessType(String type) {
    switch (type) {
      case AppStrings.noAccess:
        state = state.copyWith(
          selectedType: type,
          selectedAccessType: AccessLevels.noAccess.jsonString,
        );
        return;

      case AppStrings.viewOnly:
        state = state.copyWith(
          selectedType: type,
          selectedAccessType: AccessLevels.viewAccess.jsonString,
        );
        return;

      case AppStrings.editAccess:
        state = state.copyWith(
          selectedType: type,
          selectedAccessType: AccessLevels.editAccess.jsonString,
        );
        return;
    }
  }

  void updateSelectedChild(ChildData data) =>
      state = state.copyWith(selectedChild: () => data);

  void updateSelectedCareProvider(CareProviderResponse provider) =>
      state = state.copyWith(selectedCareProvider: () => provider);

  void selectContact(Contact contact) =>
      state = state.copyWith(selectedContact: () => contact);

  void updateAccessDuration(AccessDurations duration) {
    state = state.copyWith(selectedAccessDuration: () => duration);
    state = state.copyWith(showQuickTimeSelect: false);
    if (duration == AccessDurations.expiry) {
      state = state.copyWith(showQuickTimeSelect: true);
    }
  }

  void clearCarerFields({
    required BuildContext context,
    VoidCallback? onSuccess,
  }) {
    state = state.copyWith(
      carerNameController: TextEditingController(),
      personalMessageController: TextEditingController(),
      selectedAccessType: '',
      selectedAccessDuration: () => null,
      quickTimeSelection: '',
      showQuickTimeSelect: false,
      isLoading: false,
      gettingCareProviders: false,
      selectedCareProvider: () => null,
      selectedContact: () => null,
      providers: const [],
      permissions: const [],
      carerCurrentPage: 0,
    );
    onSuccess?.call();
  }

  Future<void> getSuggestedContacts({required BuildContext context}) async {
    final permission = await PermissionHandler.checkPermission(
      context: context,
      permission: Permission.contacts,
    );
    if (!permission) {
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: ErrorStrings.permissionNotGranted,
        );
      }
      return;
    }
    state = state.copyWith(gettingCareProviders: true);
    // Get all contacts
    List<Contact> contacts = await FlutterContacts.getContacts(
      withProperties: true,
    );
    state = state.copyWith(
      suggestedContacts: contacts,
      gettingCareProviders: false,
    );
  }

  void filterContacts({required String query}) {
    state = state.copyWith(gettingCareProviders: true);
    final List<Contact> fullContactList = state.suggestedContacts.toList();
    List<Contact> interimContactList = state.suggestedContacts.toList();

    if (query.isEmpty) {
      state = state.copyWith(
        gettingCareProviders: false,
        suggestedContacts: fullContactList,
      );
      return;
    }

    interimContactList = interimContactList
        .where((e) => e.displayName.contains(query))
        .toList();
    state = state.copyWith(
      gettingCareProviders: false,
      suggestedContacts: interimContactList,
    );
  }

  void addToPermissions(CarePermissions permissions) {
    List<CarePermissions> interimList = state.permissions.toList();
    interimList = interimList.toList()..add(permissions);
    state = state.copyWith(permissions: interimList.toList());
  }

  void removeFromPermissions(CarePermissions permissions) {
    List<CarePermissions> interimList = state.permissions.toList();
    interimList = interimList..remove(permissions);
    state = state.copyWith(permissions: interimList.toList());
  }

  void validateFirstPage(BuildContext context) {
    if (state.selectedCareProvider != null) {
      state.carerPageController.nextPage(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      updatePage(1);
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseSelectAProvider,
    );
  }

  void validateSecondPage(BuildContext context) {
    if (state.permissions.isNotEmpty && state.selectedAccessType.isNotBlank) {
      state.carerPageController.nextPage(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      updatePage(2);
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseSetPermissions,
    );
  }

  void validateThirdPage(BuildContext context) {
    if (state.selectedAccessDuration != null &&
        state.quickTimeSelection.isNotBlank) {
      inviteChildCareProvider(context);
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseSelectAccessDuration,
    );
  }

  Future<void> getCareProvider(BuildContext context) async {
    state = state.copyWith(gettingCareProviders: true);
    final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

    try {
      final response = await CarerApi.getCareProvider(
        authToken: authToken,
        query: GetCarerQuery(
          fullName: !state.carerNameController.text.isValidEmail
              ? state.carerNameController.text
              : '',
          email: state.carerNameController.text.isValidEmail
              ? state.carerNameController.text
              : '',
        ),
      );

      state = state.copyWith(
        gettingCareProviders: false,
        providers: response.data ?? [],
      );
    } on BaseError catch (e) {
      state = state.copyWith(gettingCareProviders: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(gettingCareProviders: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  Future<void> inviteChildCareProvider(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

    try {
      final response = await CarerApi.postCarerInvite(
        authToken: authToken,
        request: PostCarerInviteRequest(
          careProviderId: state.selectedCareProvider?.id ?? '',
          childId: state.selectedChild?.id ?? '',
          permissions: state.permissions,
          accessType: state.selectedAccessType.jsonAccessLevels!,
          accessDuration: AccessDuration(
            type: state.selectedAccessDuration,
            expiryDateTime: state.selectedTimeDuration,
          ),
          message: state.personalMessageController.text,
        ),
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
        context.pushSuper(AddCarerInvitationSent());
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
