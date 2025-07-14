import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/api/carer/response/care_provider_response.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class SuggestedCareProviderInfoTile extends StatelessWidget {
  final CareProviderResponse providerInfo;
  final bool selected;
  final ValueChanged onTap;
  const SuggestedCareProviderInfoTile({
    super.key,
    required this.providerInfo,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(providerInfo),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 48.ah,
            width: 48.aw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.softSupportAccent2,
              borderRadius: BorderRadius.circular(16.ar),
            ),
            child: Text(
              '${providerInfo.fullName?.split(' ').first[0] ?? ''}${(providerInfo.fullName ?? '').split(' ').length > 1 ? providerInfo.fullName!.split(' ')[1][0] : ''}',
              style: AppTextStyles.h3Inter(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.pastelGreen,
              ),
            ),
          ),
          12.sbW,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                providerInfo.fullName ?? AppStrings.careProvider,
                style: AppTextStyles.h3Inter(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                providerInfo.email ?? '',
                style: AppTextStyles.body2RegularInter(
                  context,
                ).copyWith(color: AppColors.slateCharcoal60),
              ),
            ],
          ),
          const Spacer(),
          if (selected) ...[
            Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              size: 22.ar,
              color: AppColors.pastelGreen,
            ),
          ],
        ],
      ),
    );
  }
}
