import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cart/cart.dart';
import 'package:state_management/catalog/catalog.dart';
import 'package:state_management/shopping_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const routeKey = "ShoppingCart";

  const MyApp({Key? key, this.shoppingRepository})
      : super(key: key);

  final ShoppingRepository? shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository!,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository!,
          )..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Shopping Cart',
        initialRoute: '/',
        routes: {
          '/': (_) => CatalogPage(),
          '/cart': (_) => const CartPage(),
        },
      ),
    );
  }
}
