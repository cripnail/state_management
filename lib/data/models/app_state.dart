
import 'package:flutter/material.dart';

import 'cartItem.dart';

@immutable
class AppState {
  final List<CartItem> cartList;

  const AppState({this.cartList = const []});
}
