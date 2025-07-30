import 'package:flutter/services.dart';

/// TextInputFormatter for time input in HH:MM format (00:00 to 23:59)
final class TimeInputFormatter extends TextInputFormatter {
  static const int _maxLength = 5;
  static const String _separator = ':';
  static const (int min, int max) _hourRange = (0, 23);
  static const (int min, int max) _minuteRange = (0, 59);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final result = switch (text.length) {
      <= _maxLength => _formatAndValidate(text, newValue.selection.end),
      _ => null,
    };

    return result != null
        ? TextEditingValue(
      text: result.$1,
      selection: TextSelection.collapsed(offset: result.$2),
    )
        : oldValue;
  }

  (String text, int cursor)? _formatAndValidate(String input, int originalCursor) {
    final cleanText = input.replaceAll(RegExp(r'[^0-9:]'), '');
    final (formattedText, newCursor) = _applyFormatting(cleanText, originalCursor);

    return _validateTime(formattedText) ? (formattedText, newCursor) : null;
  }

  (String text, int cursor) _applyFormatting(String cleanText, int originalCursor) {
    final buffer = StringBuffer();
    var cursorPosition = originalCursor;

    for (var i = 0; i < cleanText.length && buffer.length < _maxLength; i++) {
      final char = cleanText[i];

      // Auto-insert colon after hour
      if (buffer.length == 2 && char != _separator) {
        buffer.write(_separator);
        if (cursorPosition > 2) cursorPosition++;
      }

      if (char == _separator && buffer.length != 2) continue;
      buffer.write(char);
    }

    return (buffer.toString(), cursorPosition.clamp(0, buffer.length));
  }

  bool _validateTime(String time) => switch (time.length) {
    1 => int.tryParse(time[0])?.let((v) => v <= 2) ?? false,
    2 => int.tryParse(time)?.let((v) => v >= _hourRange.$1 && v <= _hourRange.$2) ?? false,
    3 => _validateTime(time.substring(0, 2)) && time[2] == _separator,
    4 => _validateTime(time.substring(0, 3)) && (int.tryParse(time[3])?.let((v) => v <= 5) ?? false),
    5 => _isValidCompleteTime(time),
    _ => false,
  };

  bool _isValidCompleteTime(String time) {
    final parts = time.split(_separator);
    if (parts.length != 2) return false;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    return hour != null && minute != null &&
        hour >= _hourRange.$1 && hour <= _hourRange.$2 &&
        minute >= _minuteRange.$1 && minute <= _minuteRange.$2;
  }
}

extension on int {
  T? let<T>(T Function(int) block) => block(this);
}