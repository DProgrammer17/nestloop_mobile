import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  ///Slate color series
  static const slateCharcoalMain = Color(0xFF2A2D34);
  static const slateCharcoal40 = Color(0xFFAAABAE);
  static const slateCharcoal06 = Color(0xFFF4F4F5);
  static const slateCharcoal20 = Color(0xFFD4D5D6);
  static const slateCharcoal60 = Color(0xFF7F8185);
  static const slateCharcoal80 = Color(0xFF55575D);

  ///Soft Support Series
  static const softSupportAccent2 = Color(0xFFECF1EB);

  ///Base colors
  static const baseGreen = Color(0xFF34C759);
  static const baseRed = Color(0xFFFF3B30);
  static const baseBlue = Color(0xFF007AFF);
  static const baseBlack = Color(0xFF1C1B1F);

  ///Accent color series
  static const baseBackground = Color(0xFFFDFDFC);
  static const primaryOrange = Color(0xFFF4B759);
  static const highlightCTAOrange = Color(0xFFF8845C);
  static const highlightCTARed = Color(0xFFEF485A);
  static const secondaryPop = Color(0xFF9F6B99);
  static const neutralWhite = Color(0xFFFFFFFF);
  static const neutralGrey = Color(0xFF64748B);
  static const onlineGreen = Color(0xFF10B981);
  static const pastelGreen = Color(0xFFC4D4C1);
  static const failRed = Color(0xFFFF554A);
  static const textBlack = Color(0xFF171717);
  static const textGrey = Color(0xFFCBD5E1);
  static const textGrey2 = Color(0xFF334155);
  static const backgroundGrey = Color(0xFFFBFBFB);
  static const overlayGrey = Color(0xFF2A2D34);
  static const textWhite = Color(0xFFF5F5F5);
  static const basePlum = Color(0xFFF87171);
  static const indigo = Color(0xFF6366F1);
  static const violet = Color(0xFFA78BFA);

  ///Linear Gradients
  static const sosGradient = LinearGradient(
    colors: [Color(0xFFF8845C), Color(0xFFE55422)],
  );
}
