import 'package:cambio/app/components/custom_currency_inputs.dart';
import 'package:cambio/app/controllers/HomeController.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final toText = TextEditingController();
  final fromText = TextEditingController();
  late HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40, right: 25, left: 25, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.monetization_on,
              color: Colors.amber,
              size: 120,
            ),
            CustomCurrencyInlineBox(
              controller: fromText,
              items: homeController.currencies,
              selectedItem: homeController.fromCurrency,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model!;
                });
              },
            ),
            CustomCurrencyInlineBox(
              controller: toText,
              items: homeController.currencies,
              selectedItem: homeController.toCurrency,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model!;
                });
              },
            ),
            SizedBox(
              height: 14,
            ),
            RaisedButton(
              onPressed: () {
                homeController.convert();
              },
              color: Colors.amber,
              textColor: Colors.black,
              child: Text(
                'Converter',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
