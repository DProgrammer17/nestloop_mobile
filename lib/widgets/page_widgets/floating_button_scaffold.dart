import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class FloatingWidgetScaffold extends StatelessWidget {
  final Widget pageContent;
  final Widget floatingWidget;
  final double? bottomPositioned;
  const FloatingWidgetScaffold({
    super.key,
    required this.pageContent,
    required this.floatingWidget,
    this.bottomPositioned,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        pageContent,
        Positioned(bottom: 27.ah, child: floatingWidget),
      ],
    );
  }
}
