import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/features/home/ui/home_page.dart';
import 'package:nest_loop_mobile/features/profiles/ui/profiles_page.dart';

class BottomNavModel{
  final int? currentIndex;
  final List<Widget> navPages;

  const BottomNavModel({
    this.currentIndex = 0,
    this.navPages = const [
      HomePage(),
      ProfilesPage(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ],
  });

  BottomNavModel copyWith({
    int? currentIndex,
    List<Widget>? navPages,
  }) {
    return BottomNavModel(
      currentIndex: currentIndex ?? this.currentIndex,
      navPages: navPages ?? this.navPages,
    );
  }
}