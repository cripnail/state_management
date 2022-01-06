import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/models/cart.dart';
import 'package:state_management/models/catalog.dart';
import 'package:state_management/redux/reducers.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';
import 'package:state_management/state/app_state.dart';
import 'common/theme.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyCatalog(),
          '/cart': (context) => MyCart(store: store,),
        },
      ),
    );
  }
}
