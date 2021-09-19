import 'package:cambio/app/views/home_view.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark),
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          '\$Cambio\$',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(child: HomeView()),
    ),
  ));
}
