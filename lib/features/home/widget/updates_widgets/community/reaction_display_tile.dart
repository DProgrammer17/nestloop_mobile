import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class ReactionDisplayTile extends StatelessWidget {
  final List<PostReactions> reactions;
  final bool useSecondaryColor;
  const ReactionDisplayTile({super.key, required this.reactions, this.useSecondaryColor = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (reactions.any((e) => e.reaction == 'heart')) ...[
          Container(
            height: 32.ah,
            width: 45.aw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.ar),
              color: AppColors.slateCharcoalMain,
            ),
            child: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.pink,
              size: 22.ar,
            ),
          ),
        ],
        if (reactions.any((e) => e.reaction == 'clap')) ...[
          4.sbW,
          Container(
            height: 32.ah,
            width: 45.aw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.ar),
              color: useSecondaryColor ? AppColors.softSupportAccent2 : AppColors.baseBackground,
            ),
            child: Image.asset(
              AppAssets.clapReactionImage,
              height: 22.ah,
              width: 16.aw,
            ),
          ),
        ],
        4.sbW,
        Container(
          height: 32.ah,
          width: 36.aw,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.ar),
            color: useSecondaryColor ? AppColors.softSupportAccent2 : AppColors.baseBackground,
          ),
          child: Icon(
            Symbols.add_reaction,
            size: 16.ar,
            color: AppColors.slateCharcoal80,
          ),
        ),
      ],
    );
  }
}
