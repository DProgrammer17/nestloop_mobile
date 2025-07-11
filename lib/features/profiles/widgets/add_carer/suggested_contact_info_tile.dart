import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class SuggestedContactInfoTile extends StatelessWidget {
  final Contact contactInfo;
  const SuggestedContactInfoTile({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 18.ah, horizontal: 12.aw),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.pastelGreen,
            borderRadius: BorderRadius.circular(16.ar),
          ),
          child: Text(
            '${contactInfo.name.first[0]}${contactInfo.name.last[0]}',
            style: AppTextStyles.h3Inter(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.pastelGreen,
            ),
          ),
        ),
        12.sbH,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contactInfo.displayName,
              style: AppTextStyles.h3Inter(
                context,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
            6.sbH,
            Text(
              contactInfo.emails[0].address.isNotBlank
                  ? contactInfo.emails[0].address
                  : contactInfo.phones[0].number,
              style: AppTextStyles.h3Inter(
                context,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}
