import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/market_place/market_place_offer_tab_widget.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/market_place/market_place_update_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dropdowns/app_dropdown.dart';

class MarketUpdatesPage extends ConsumerWidget {
  const MarketUpdatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.ah, horizontal: 12.aw),
        child: Column(
          children: [
            MarketPlaceOfferTabWidget(),
            24.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.activeOffers,
                  style: AppTextStyles.h5Inter(
                    context,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    AppDropDownField(
                      width: 83.aw,
                      style: AppTextStyles.body2RegularInter(
                        context,
                      ).copyWith(color: AppColors.slateCharcoal80),
                      itemStyle: AppTextStyles.body2RegularInter(
                        context,
                      ).copyWith(color: AppColors.slateCharcoal80),
                      list: AppStrings.offersType,
                      onChanged: (type) {},
                    ),
                    4.sbW,
                    AppDropDownField(
                      width: 93.aw,
                      style: AppTextStyles.body2RegularInter(
                        context,
                      ).copyWith(color: AppColors.slateCharcoal80),
                      itemStyle: AppTextStyles.body2RegularInter(
                        context,
                      ).copyWith(color: AppColors.slateCharcoal80),
                      list: AppStrings.offersStatus,
                      onChanged: (status) {},
                    ),
                  ],
                ),
              ],
            ),
            16.sbH,
            Column(
              spacing: 8.ah,
              children: List.generate(
                ref.watch(homeNotifier).marketPlaceUpdates.length,
                (index) => MarketPlaceUpdateWidget(
                  offer: ref
                      .watch(homeNotifier)
                      .marketPlaceUpdates
                      .elementAt(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
