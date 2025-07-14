enum CarePermissions {
  profileBasics('PROFILE_BASICS', 'Profile Basics'),
  careDetails('CARE_DETAILS', 'Care Details'),
  documents('DOCUMENTS', 'Documents'),
  none('none', 'None');

  const CarePermissions(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension CarePermissionsFromString on String? {
  CarePermissions? get jsonCarePermissions {
    return CarePermissions.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => CarePermissions.none,
    );
  }

  CarePermissions? get displayCarePermissions {
    return CarePermissions.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => CarePermissions.none,
    );
  }
}
