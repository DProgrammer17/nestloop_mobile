import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_model.dart';
import 'package:nest_loop_mobile/utils/enums/access_duration.dart';
import 'package:nest_loop_mobile/utils/enums/access_level.dart';
import 'package:nest_loop_mobile/utils/permissions/permissions_handler.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';
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

  void updateTimeOption(String time) =>
      state = state.copyWith(quickTimeSelection: time);

  void selectorUpdateAccessType(String type)=> state = state.copyWith(selectedAccessType: type);

  void updateAccessDuration(AccessDuration duration) {
    state = state.copyWith(selectedAccessDuration: () => duration);
    if (duration == AccessDuration.timeLimited) {
      state = state.copyWith(showQuickTimeSelect: true);
    }
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
    state = state.copyWith(gettingContacts: true);
    // Get all contacts
    List<Contact> contacts = await FlutterContacts.getContacts(
      withProperties: true,
    );
    state = state.copyWith(suggestedContacts: contacts, gettingContacts: false);
  }

  void filterContacts({required String query}) {
    state = state.copyWith(gettingContacts: true);
    final List<Contact> fullContactList = state.suggestedContacts.toList();
    List<Contact> interimContactList = state.suggestedContacts.toList();

    if (query.isEmpty) {
      state = state.copyWith(
        gettingContacts: false,
        suggestedContacts: fullContactList,
      );
      return;
    }

    interimContactList = interimContactList
        .where((e) => e.displayName.contains(query))
        .toList();
    state = state.copyWith(
      gettingContacts: false,
      suggestedContacts: interimContactList,
    );
  }
}
