import 'package:cambio/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CustomCurrencyInlineBox extends StatelessWidget {
  List<CurrencyModel> items;
  final TextEditingController controller;
  CurrencyModel selectedItem;
  void Function(CurrencyModel? model)? onChanged;

  CustomCurrencyInlineBox(
      {required this.controller,
      required this.items,
      required this.selectedItem,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 64,
              child: DropdownButton<CurrencyModel>(
                value: selectedItem,
                isDense: false,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: items
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList(),
                isExpanded: true,
                onChanged: onChanged,
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
            ))
      ],
    );
  }
}
