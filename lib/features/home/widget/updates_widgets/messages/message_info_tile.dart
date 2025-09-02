import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/interim_message_model.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class MessageInfoTile extends StatelessWidget{
  final InterimMessageModel message;
  const MessageInfoTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(18.ar),
        color: AppColors.baseBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(image: message.url, height: 48.ah, width: 48.aw, radius: 16.ar,),
          16.sbW,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.sender,
                style: AppTextStyles.h3Inter(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.sbH,
              SizedBox(
                width: 200.aw,
                child: Text(
                  message.lastMessage,
                  style: AppTextStyles.body2RegularInter(context).copyWith(
                    color: AppColors.slateCharcoal60,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text(
               message.time.toIso8601String().dateTo12HourFormat(),
               style: AppTextStyles.body1RegularInter(context).copyWith(
                 fontWeight: FontWeight.w500,
                 color: AppColors.slateCharcoal60,
               ),
             ),
             20.sbH,
             message.unreadCount < 1 ? Container(
               height: 7.ah,
               width: 7.aw,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: AppColors.highlightCTARed,
               ),
             ): Container(
               height: 23.aw,
               width: 23.ah,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 color: AppColors.highlightCTARed,
                 shape: BoxShape.circle,
                 border: Border.all(width: 2.aw, color: AppColors.baseBackground),
               ),
               child: Text(
                 message.unreadCount.toString(),
                 style: AppTextStyles.body2RegularInter(context).copyWith(
                   fontWeight: FontWeight.w600,
                   color: AppColors.baseBackground,
                 ),
               ),
             ),
           ],
          ),
        ],
      ),
    );
  }

}