enum UserRoles {
  parent('PARENT', 'Parent'),
  careProvider('CARE_PROVIDER', 'Care Provider'),
  admin('ADMIN', 'Admin'),
  none('none', 'None');

  const UserRoles(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension UserRolesFromString on String? {
  UserRoles? get jsonUserRoles {
    return UserRoles.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => UserRoles.none,
    );
  }

  UserRoles? get displayUserRoles {
    return UserRoles.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => UserRoles.none,
    );
  }
}
