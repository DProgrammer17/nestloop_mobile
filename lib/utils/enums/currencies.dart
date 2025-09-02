enum Currencies {
  usd('USD', '\$'),
  ngn('NGN', '₦'),
  gbp('GBP', '£'),
  none('none', 'None');

  const Currencies(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension CurrenciesFromString on String? {
  Currencies? get jsonCurrencies {
    return Currencies.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => Currencies.none,
    );
  }

  Currencies? get displayCurrencies {
    return Currencies.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => Currencies.none,
    );
  }
}
