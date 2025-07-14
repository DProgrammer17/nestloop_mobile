import 'package:flutter/services.dart';

class DateInputFormatterYYYYMMdd extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    // Don't format if user is deleting
    if (text.length < oldValue.text.length) {
      return newValue;
    }

    // Auto-add hyphens at appropriate positions
    String formatted = '';
    int selectionIndex = newValue.selection.end;

    for (int i = 0; i < text.length && i < 10; i++) {
      if (i == 4 || i == 7) {
        if (text[i] != '-') {
          formatted += '-';
          if (i < selectionIndex) selectionIndex++;
        }
      }
      if (i < text.length) {
        formatted += text[i];
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}