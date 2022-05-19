import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/reducers/app_reducer.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';

import 'models/app_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: const AppState(),
  );

  MyApp({Key? key, store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Shopping Cart',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ProductSans',
          primaryColor: const Color.fromRGBO(243, 113, 95, 1),
        ),
        routes: <String, WidgetBuilder>{
          '/': (_) => const HomeScreen(),
          '/cart': (_) => const MyCart(),
        },
        // home: const HomeScreen(),
      ),
    );
  }
}
