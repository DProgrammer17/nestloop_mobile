import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_access_duration.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_first_page.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_set_permissions.dart';
import 'package:nest_loop_mobile/network/api/carer/response/care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/care_permissions.dart';

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
  final List<CarePermissions> permissions;
  final String selectedAccessType;
  final String selectedType;
  final AccessDurations? selectedAccessDuration;
  final ChildData? selectedChild;
  final CareProviderResponse? selectedCareProvider;
  final List<CareProviderResponse> providers;
  final String quickTimeSelection;
  final DateTime? selectedTimeDuration;
  final bool showQuickTimeSelect;
  final bool gettingCareProviders;
  final bool isLoading;

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
    this.permissions = const [],
    this.providers = const [],
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
    this.selectedType = '',
    this.selectedAccessDuration,
    this.selectedChild,
    this.selectedCareProvider,
    this.quickTimeSelection = '',
    this.selectedTimeDuration,
    this.showQuickTimeSelect = false,
    this.gettingCareProviders = false,
    this.isLoading = false,
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
    List<CarePermissions>? permissions,
    String? selectedAccessType,
    String? selectedType,
    AccessDurations? Function()? selectedAccessDuration,
    ChildData? Function()? selectedChild,
    CareProviderResponse? Function()? selectedCareProvider,
    List<CareProviderResponse>? providers,
    String? quickTimeSelection,
    DateTime? Function()? selectedTimeDuration,
    bool? showQuickTimeSelect,
    bool? gettingCareProviders,
    bool? isLoading,
  }) {
    return AddCarerModel(
      carerPageController: carerPageController ?? this.carerPageController,
      carerCurrentPage: carerCurrentPage ?? this.carerCurrentPage,
      carerNameController: carerNameController ?? this.carerNameController,
      personalMessageController:
          personalMessageController ?? this.personalMessageController,
      suggestedContacts: suggestedContacts ?? this.suggestedContacts,
      carerPages: carerPages ?? this.carerPages,
      permissions: permissions ?? this.permissions,
      selectedContact: selectedContact != null
          ? selectedContact()
          : this.selectedContact,
      timeOptions: timeOptions ?? this.timeOptions,
      accessTypes: accessTypes ?? this.accessTypes,
      providers: providers ?? this.providers,
      selectedAccessType: selectedAccessType ?? this.selectedAccessType,
      selectedType: selectedType ?? this.selectedType,
      showQuickTimeSelect: showQuickTimeSelect ?? this.showQuickTimeSelect,
      quickTimeSelection: quickTimeSelection ?? this.quickTimeSelection,
      gettingCareProviders: gettingCareProviders ?? this.gettingCareProviders,
      isLoading: isLoading ?? this.isLoading,
      selectedAccessDuration: selectedAccessDuration != null
          ? selectedAccessDuration()
          : this.selectedAccessDuration,
      selectedChild: selectedChild != null
          ? selectedChild()
          : this.selectedChild,
      selectedCareProvider: selectedCareProvider != null
          ? selectedCareProvider()
          : this.selectedCareProvider,
      selectedTimeDuration: selectedTimeDuration != null
          ? selectedTimeDuration()
          : this.selectedTimeDuration,
    );
  }
}
