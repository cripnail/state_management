import 'package:state_management/models/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartListProvider = StateNotifierProvider((ref) {
  return CartModel([]); // Init empty cart
});