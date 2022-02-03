import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/cart.dart';
import 'package:state_management/models/catalog.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';
import 'common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: const Color.fromRGBO(243, 113, 95, 1),
      ),
      home: const CatalogPage(),
    );
  }
}
