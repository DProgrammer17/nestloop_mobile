extension IntToKFormat on int {
  String toKFormat() {
    if (this < 1000) {
      return toString();
    }

    double value = this / 1000.0;

    // Format with up to 2 decimal places, removing trailing zeros
    String formatted = value.toStringAsFixed(2);
    formatted = formatted.replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');

    return '${formatted}k';
  }
}