import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/ui/add_carer/add_carer_page.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/care_team_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/floating_button_scaffold.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/no_data_page.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/screen_loader.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class CareTeamPage extends ConsumerStatefulWidget {
  final String childProfileID;
  const CareTeamPage({super.key, required this.childProfileID});

  @override
  ConsumerState<CareTeamPage> createState() => _CareTeamPageState();
}

class _CareTeamPageState extends ConsumerState<CareTeamPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(profilesNotifier.notifier)
          .getCareProviders(
            context: context,
            childProfileID: widget.childProfileID,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLoader(
      isLoading: ValueNotifier(ref.watch(profilesNotifier).isCareTeamLoading),
      child: FloatingWidgetScaffold(
        floatingWidget: AppButton(
          onTap: () => context.pushSuper(AddCarerPage()),
          title: AppStrings.newCarer,
          prefixButtonIcon: Icon(
            Icons.person_add_alt_1_outlined,
            size: 22.ar,
            color: AppColors.neutralWhite,
          ),
          borderColor: AppColors.neutralWhite,
          borderWidth: 4.aw,
        ),
        pageContent: Builder(
          builder: (context) {
            if (ref.watch(profilesNotifier).careTeam.isEmpty) {
              return NoDataPage(
                title: ErrorStrings.noCareProvidersFound,
                subtitle: ErrorStrings.addSomeCareProviders,
              );
            }
            return RefreshIndicator(
              onRefresh: ()=>    ref
                  .watch(profilesNotifier.notifier)
                  .getCareProviders(
                context: context,
                childProfileID: widget.childProfileID,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ref.watch(profilesNotifier).careTeam.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.ah),
                    child: CareTeamInfoTile(
                      model: ref
                          .watch(profilesNotifier)
                          .careTeam
                          .elementAt(index),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
