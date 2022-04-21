import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';
import 'package:state_management/shared/services/rest_product_service.dart';
import 'package:state_management/stores/home_store.dart';
import 'package:state_management/stores/shopping_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeStore>(create: (_) => HomeStore(RestProductService())),
        Provider<ShoppingCart>(create: (_) => ShoppingCart())
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
