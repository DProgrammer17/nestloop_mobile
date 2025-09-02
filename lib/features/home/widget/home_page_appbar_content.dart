import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class HomePageAppBarContent extends StatelessWidget {
  final String imageUrl;
  final String name;
  const HomePageAppBarContent({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(AppAssets.homeBackgroundImage), // local asset
          fit: BoxFit.cover, // how the image should be fitted
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          16.sbH,
          AppNetworkImage(
            image: imageUrl,
            useBorderRadius: true,
            radius: 16.ar,
            height: 48.ah,
            width: 48.aw,
          ),
          10.sbH,
          Text(
            AppStrings.welcomeBackSmall,
            style: AppTextStyles.h1Satoshi(
              context,
            ).copyWith(color: AppColors.slateCharcoal40),
          ),
          Text(
            name,
            style: AppTextStyles.h1Satoshi(
              context,
            ).copyWith(color: AppColors.neutralWhite, fontSize: 28.asp),
          ),
        ],
      ),
    );
  }
}
