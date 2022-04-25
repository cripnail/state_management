import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management/redux/reducers.dart';
import 'package:state_management/screens/catalog.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'models/catalog.dart';

void main() {
  final store = DevToolsStore<List<Item>>(cartItemsReducer, initialState: []);

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final DevToolsStore<List<Item>> store;

  const MyApp({required this.store, Key? key}) : super(key: key);

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
        home: const MyCatalog(),
      ),
    );
  }
}
