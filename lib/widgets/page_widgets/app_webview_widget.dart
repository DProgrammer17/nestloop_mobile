import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/core/utility_state/webview/webview_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebViewWidget extends ConsumerStatefulWidget {
  final String url;
  final String? title;
  const AppWebViewWidget({super.key, required this.url, this.title,});

  @override
  ConsumerState<AppWebViewWidget> createState() => _AppWebViewWidgetState();
}

class _AppWebViewWidgetState extends ConsumerState<AppWebViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(webViewNotifier.notifier).controllerSetUp(url: widget.url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.neutralWhite,
      padding: EdgeInsets.zero,
      appBarLeadingContent: AppBackButton(),
      appBarContent: Text(
        widget.title ?? '',
        style: AppTextStyles.h3Inter(context),
      ),
      centerTile: true,
      body: Container(
        color: AppColors.baseBackground,
        child: Builder(
          builder: (_) {
            if (ref.watch(webViewNotifier).webViewController == null) {
              return const SizedBox.shrink();
            }

            return WebViewWidget(
              controller: ref.watch(webViewNotifier).webViewController!,
            );
          },
        ),
      ),
    );
  }
}
