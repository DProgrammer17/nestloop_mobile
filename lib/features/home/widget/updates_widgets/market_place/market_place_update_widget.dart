import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_marketplace_model.dart';
import 'package:nest_loop_mobile/utils/enums/currencies.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/utils/helper_utils.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class MarketPlaceUpdateWidget extends StatelessWidget {
  final MarketplaceNotification offer;
  const MarketPlaceUpdateWidget({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
      contentSpacing: 0,
      outerContent: SizedBox.shrink(),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 8.aw),
        decoration: BoxDecoration(
          color: AppColors.baseBackground,
          borderRadius: BorderRadius.circular(16.ar),
        ),
        child: Row(
          children: [
            AppNetworkImage(
              image: offer.imageUrl,
              height: 81.ah,
              width: 81.aw,
              radius: 10.ar,
            ),
            12.sbW,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: AppTextStyles.body2RegularInter(
                    context,
                  ).copyWith(color: AppColors.slateCharcoal80),
                ),
                4.sbH,
                Text(
                  '${Currencies.values.firstWhere((e)=> e.jsonString == offer.currency).displayString} ${HelperUtils.noSymbolFormat.format(offer.price)}',
                  style: AppTextStyles.h5Inter(
                    context,
                  ).copyWith(fontWeight: FontWeight.w900),
                ),
                12.sbH,
                Row(
                  children: [
                    SmallInfoButton(
                      leading: Icon(
                        Symbols.arrow_upward,
                        size: 15.ar,
                        color: AppColors.slateCharcoalMain,
                      ),
                      title: AppStrings.offersTypeStatus(offer.status),
                      textStyle: AppTextStyles.body1RegularInter(context),
                      onTap: () {},
                    ),
                    4.sbW,
                    SmallInfoButton(
                      leading: Icon(
                        Symbols.directions_walk,
                        size: 15.ar,
                        color: AppColors.slateCharcoalMain,
                      ),
                      title: offer.deliveryMethod,
                      textStyle: AppTextStyles.body1RegularInter(context),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomContent: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.xmark,
                size: 20.ar,
                color: AppColors.slateCharcoal60,
              ),
              12.sbW,
              Text(
                AppStrings.cancel,
                style: AppTextStyles.h3Inter(context),
              ),
            ],
          ),
          34.sbW,
          AbsorbPointer(
            absorbing: offer.paid,
            child: Opacity(
              opacity: offer.paid ? 0.5 : 1,
              child: AppButton(
                onTap: (){},
                title: AppStrings.payViaEscrow,
                buttonIcon: SvgPicture.asset(
                  SvgAssets.arrowCircleRightIcon,
                  height: 24.ah,
                  width: 24.aw,
                  color: AppColors.neutralWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
