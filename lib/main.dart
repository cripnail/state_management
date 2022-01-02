import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/cart.dart';
import 'package:state_management/models/catalog.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';
import 'common/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'ProductSans',
        primaryColor: const Color.fromRGBO(243, 113, 95, 1),
      ),
      home: const MyCatalog(),
    );
  }
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Using MultiProvider is convenient when providing multiple objects.
//     return MultiProvider(
//       providers: [
//         // In here CatalogModel never changes, so a simple Provider
//         // is sufficient.
//         Provider(create: (context) => CatalogModel()),
//         // CartModel is implemented as a ChangeNotifier, which calls for the use
//         // of ChangeNotifierProvider. Moreover, CartModel depends
//         // on CatalogModel, so a ProxyProvider is needed.
//         ChangeNotifierProxyProvider<CatalogModel, CartModel>(
//           create: (context) => CartModel(),
//           update: (context, catalog, cart) {
//             if (cart == null) throw ArgumentError.notNull('cart');
//             cart.catalog = catalog;
//             return cart;
//           },
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Provider Demo',
//         theme: appTheme,
//         initialRoute: '/',
//         routes: {
//           '/': (context) => const MyCatalog(),
//           '/cart': (context) => const MyCart(),
//         },
//       ),
//     );
//   }
// }