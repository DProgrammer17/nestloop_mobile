import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/community/community_date_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';

class CommunityUpdatesPage extends ConsumerWidget {
  const CommunityUpdatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 12.aw),
        child: Builder(
          builder: (context) {
            final editedList = ref.watch(homeNotifier.notifier).returnSortedList();
            return Column(
              children: List.generate(
                editedList.length,
                (index) => CommunityDateWidget(
                  notification:editedList.elementAt(index),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
