import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';

class MarketPlaceOfferTabWidget extends ConsumerWidget{
  const MarketPlaceOfferTabWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.ah, horizontal: 4.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.ar),
        color: AppColors.slateCharcoal06,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: ()=> ref.watch(homeNotifier.notifier).updateOffers(AppStrings.sent),
            child: Container(
              width: AppConstants.deviceWidth * 0.46,
              padding: EdgeInsets.symmetric(vertical: 10.ah),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.ar),
                color: ref.watch(homeNotifier).offersTypes == AppStrings.sent ? AppColors.baseBackground : Colors.transparent,
              ),
              child: Text(
                AppStrings.sent,
                style: AppTextStyles.h3Inter(context).copyWith(
                  fontSize: 13.asp,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: ()=> ref.watch(homeNotifier.notifier).updateOffers(AppStrings.received),
            child: Container(
              width: AppConstants.deviceWidth * 0.46,
              padding: EdgeInsets.symmetric(vertical: 10.ah),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.ar),
                color: ref.watch(homeNotifier).offersTypes == AppStrings.received ? AppColors.baseBackground : Colors.transparent,
              ),
              child: Text(
                AppStrings.received,
                style: AppTextStyles.h3Inter(context).copyWith(
                  fontSize: 13.asp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}