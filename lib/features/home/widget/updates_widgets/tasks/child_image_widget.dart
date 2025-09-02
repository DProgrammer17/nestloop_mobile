import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class ChildImageWidget extends ConsumerWidget {
  final ChildData child;
  final ChildData selectedChild;
  final ValueChanged<ChildData> onSelect;
  const ChildImageWidget({
    super.key,
    required this.child,
    required this.selectedChild,
    required this.onSelect,
  });

  bool get selected => child.id == selectedChild.id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: ()=> onSelect.call(child),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
        decoration: BoxDecoration(
          color: selected ? AppColors.baseBackground : AppColors.slateCharcoal06,
          borderRadius: BorderRadius.circular(24.ar),
          border: Border.all(
            color: selected ? AppColors.primaryOrange : Colors.transparent,
            width: 2.aw,
          ),
        ),
        child: AppNetworkImage(
          image: child.avatar?.url ?? '',
          height: 52.ah,
          width: 52.aw,
          radius: 12.ar,
        ),
      ),
    );
  }
}
