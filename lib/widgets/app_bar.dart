
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models/app_state.dart';
import '../models/cart_item.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({Key? key,  required Widget title, required BuildContext context})
      : super(key: key,
          title: title,
          actions: <Widget>[
            StoreConnector<AppState, List<CartItem>>(
              converter: (store) => store.state.cartList,
              builder: (_, cartList) {
                return SliverAppBar(
                  title: Text('Catalog',
                      style: Theme.of(context).textTheme.headline1),
                  floating: true,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                    ),
                  ],
                );
              },
            )
          ],
        );

  static Widget buildBadge(int num) {
    return CircleAvatar(
      radius: 10.0,
      backgroundColor: Colors.red,
      child: Text(
        '$num',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
