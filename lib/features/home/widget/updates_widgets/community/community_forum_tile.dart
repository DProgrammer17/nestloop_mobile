import 'package:flutter/material.dart';
import 'package:image_palette_extractor/image_palette_extractor.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class CommunityForumTile extends StatefulWidget {
  final CommunityPost notification;
  const CommunityForumTile({super.key, required this.notification});

  @override
  State<CommunityForumTile> createState() => _CommunityForumTileState();
}

class _CommunityForumTileState extends State<CommunityForumTile> {
  Color containerColor = AppColors.slateCharcoal06;

  void extractionColor() async {
    final extractor = ImagePaletteExtractor();
    final color = await extractor.extractDominantColorFromUrl(
      widget.notification.forum.url,
    );
    containerColor = color ?? AppColors.slateCharcoal06;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.ar),
        color: containerColor,
      ),
      child: Row(
        children: [
          AppNetworkImage(
            image: widget.notification.forum.url,
            height: 24.ah,
            width: 24.aw,
            shape: BoxShape.circle,
          ),
          6.sbW,
          Text(
            widget.notification.forum.name,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body1RegularInter(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
