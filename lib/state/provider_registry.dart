import 'package:state_management/models/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/catalog.dart';

final cartListProvider = StateNotifierProvider<CartModel, List<Item>>((ref) {
  return CartModel([]); // Init empty cart
});