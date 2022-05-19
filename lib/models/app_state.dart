
import 'package:flutter/material.dart';

import 'cart_item.dart';

@immutable
class AppState {
  final List<CartItem> cartList;

  const AppState({this.cartList = const []});
}
