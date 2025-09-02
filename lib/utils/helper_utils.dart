import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';

abstract class HelperUtils {
  static void popMultiple(BuildContext context, int pages) {
    for (int i = 0; i < pages; i++) {
      context.popSuper();
    }
  }

  static void executeMultiple({
    required int count,
    required VoidCallback action,
  }) {
    for (int i = 0; i < count; i++) {
      action.call();
    }
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static Future<MultipartFile> convertFileToMultipart(File file) async {
    final fileName = file.path.split('/').last;
    return await MultipartFile.fromFile(file.path, filename: fileName);
  }

  static Future<List<MultipartFile>> convertFilesToMultipart(
    List<File> files,
  ) async {
    return await Future.wait(
      files.map((file) async {
        final fileName = file.path.split('/').last;
        return await MultipartFile.fromFile(file.path, filename: fileName);
      }),
    );
  }

  static final noSymbolFormat = NumberFormat.currency(
    locale: "en",
    symbol: "",    // no currency symbol
    decimalDigits: 2,
  );
}
