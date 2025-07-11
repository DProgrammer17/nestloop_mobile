import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_access_duration.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_first_page.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_set_permissions.dart';
import 'package:nest_loop_mobile/utils/enums/access_duration.dart';

class AddCarerModel {
  final PageController carerPageController;
  final TextEditingController carerNameController;
  final TextEditingController personalMessageController;
  final int carerCurrentPage;
  final Contact? selectedContact;
  final List<Contact> suggestedContacts;
  final List<Widget> carerPages;
  final List<String> accessTypes;
  final List<String> timeOptions;
  final String selectedAccessType;
  final AccessDuration? selectedAccessDuration;
  final String quickTimeSelection;
  final bool showQuickTimeSelect;
  final bool gettingContacts;

  const AddCarerModel({
    required this.carerPageController,
    required this.carerNameController,
    required this.personalMessageController,
    this.carerCurrentPage = 0,
    this.carerPages = const [
      AddCarerFirstPage(),
      AddCarerSetPermissions(),
      AddCarerAccessDuration(),
    ],
    this.selectedContact,
    this.suggestedContacts = const [],
    this.timeOptions = const [
      AppStrings.oneDay,
      AppStrings.oneWeek,
      AppStrings.oneMonth,
      AppStrings.threeMonth,
      AppStrings.sixMonth,
    ],
    this.accessTypes = const [
      AppStrings.noAccess,
      AppStrings.viewOnly,
      AppStrings.editAccess,
    ],
    this.selectedAccessType = '',
    this.selectedAccessDuration,
    this.quickTimeSelection = '',
    this.showQuickTimeSelect = false,
    this.gettingContacts = false,
  });

  AddCarerModel copyWith({
    PageController? carerPageController,
    TextEditingController? carerNameController,
    TextEditingController? personalMessageController,
    int? carerCurrentPage,
    Contact? Function()? selectedContact,
    List<Contact>? suggestedContacts,
    List<Widget>? carerPages,
    List<String>? timeOptions,
    List<String>? accessTypes,
    String? selectedAccessType,
    AccessDuration? Function()? selectedAccessDuration,
    String? quickTimeSelection,
    bool? showQuickTimeSelect,
    bool? gettingContacts,
  }) {
    return AddCarerModel(
      carerPageController: carerPageController ?? this.carerPageController,
      carerCurrentPage: carerCurrentPage ?? this.carerCurrentPage,
      carerNameController: carerNameController ?? this.carerNameController,
      personalMessageController: personalMessageController ?? this.personalMessageController,
      suggestedContacts: suggestedContacts ?? this.suggestedContacts,
      carerPages: carerPages ?? this.carerPages,
      selectedContact: selectedContact != null ? selectedContact() : this.selectedContact,
      timeOptions: timeOptions ?? this.timeOptions,
      accessTypes: accessTypes ?? this.accessTypes,
      selectedAccessType: selectedAccessType ?? this.selectedAccessType,
      showQuickTimeSelect: showQuickTimeSelect ?? this.showQuickTimeSelect,
      quickTimeSelection: quickTimeSelection ?? this.quickTimeSelection,
      gettingContacts: gettingContacts ?? this.gettingContacts,
      selectedAccessDuration: selectedAccessDuration != null
          ? selectedAccessDuration()
          : this.selectedAccessDuration,
    );
  }
}
