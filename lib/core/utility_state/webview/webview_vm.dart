import 'package:webview_flutter/webview_flutter.dart';

class WebViewVm {
  final bool isLoading;
  final WebViewController? webViewController;

  const WebViewVm({this.isLoading = false, this.webViewController});

  WebViewVm copyWith({
    bool? isLoading,
    WebViewController? Function()? webViewController,
  }) {
    return WebViewVm(
      webViewController: webViewController != null
          ? webViewController()
          : this.webViewController,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
