import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/utility_state/webview/webview_vm.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewNotifier = NotifierProvider<WebViewNotifier, WebViewVm>(() {
  return WebViewNotifier();
});

class WebViewNotifier extends Notifier<WebViewVm> {
  @override
  WebViewVm build() => WebViewVm();

  void controllerSetUp({required String url}) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress < 100) {
              state = state.copyWith(isLoading: true);
              return;
            }
            state = state.copyWith(isLoading: false);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(url));

    state = state.copyWith(webViewController: () => controller);
  }
}
