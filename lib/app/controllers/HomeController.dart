import 'package:cambio/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;
  final TextEditingController fromText;
  final TextEditingController toText;

  HomeController({required this.fromText, required this.toText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    double value = double.tryParse(fromText.text.replaceAll(',', '.')) ?? 1.0;
    double resultCurrency = 0.0;

    if (toCurrency.name == 'Real') {
      resultCurrency = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      resultCurrency = value * fromCurrency.dolar;
    } else if (toCurrency.name == 'Euro') {
      resultCurrency = value * fromCurrency.euro;
    } else if (toCurrency.name == 'Bitcoin') {
      resultCurrency = value * fromCurrency.bitcoin;
    }

    toText.text = resultCurrency.toStringAsFixed(2);
  }
}
