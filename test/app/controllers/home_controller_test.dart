import 'package:cambio/app/controllers/HomeController.dart';
import 'package:cambio/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();
  final HomeController controller =
      HomeController(fromText: fromText, toText: toText);

  test('Converteu de reais para dolar com sucesso', () {
    fromText.text = '3';
    controller.convert();
    expect(toText.text, '0.54');
  });

  test('Converteu de dolar para real com sucesso', () {
    controller.fromCurrency = CurrencyModel.getCurrencies()[1];
    controller.toCurrency = CurrencyModel.getCurrencies()[0];
    fromText.text = '3';
    controller.convert();
    expect(toText.text, '16.95');
  });

  test('Converteu de dolar para real com virgula com sucesso', () {
    controller.fromCurrency = CurrencyModel.getCurrencies()[1];
    controller.toCurrency = CurrencyModel.getCurrencies()[0];
    fromText.text = '3,4';
    controller.convert();
    expect(toText.text, '19.21');
  });
}
