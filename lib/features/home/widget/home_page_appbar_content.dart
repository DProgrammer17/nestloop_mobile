import 'package:flutter/material.dart';
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
    return Column(
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
          AppStrings.welcomeName(name),
          style: AppTextStyles.h1Satoshi(context).copyWith(fontSize: 22.asp),
        ),
        16.sbH,
      ],
    );
  }
}
