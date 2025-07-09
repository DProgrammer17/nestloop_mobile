import 'package:nest_loop_mobile/utils/enums/access_duration.dart';
import 'package:nest_loop_mobile/utils/enums/access_level.dart';

class CareTeamModel{
  final String profile;
  final String name;
  final String email;
  final bool isParent;
  final AccessLevel accessLevel;
  final AccessDuration accessDuration;
  final DateTime? start;
  final DateTime? ends;

  const CareTeamModel({
    required this.profile,
    required this.name,
    required this.email,
    this.isParent = false,
    required this.accessLevel,
    required this.accessDuration,
    this.start,
    this.ends,
});
}