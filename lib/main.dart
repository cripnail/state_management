import 'package:flutter/material.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';

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
      // initialRoute: '/home',
      routes: {
        '/home': (context) => const CatalogPage(),
        '/cart': (context) => const MyCart(),
      },
      home: const CatalogPage(),
    );
  }
}
