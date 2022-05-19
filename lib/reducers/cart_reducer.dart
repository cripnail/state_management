import 'package:redux/redux.dart';
import '../actions/action.dart';
import '../models/cart_item.dart';

final cartListReducer = combineReducers<List<CartItem>>([
  TypedReducer<List<CartItem>, AddItemAction>(_addItem),
  TypedReducer<List<CartItem>, RemoveItemAction>(_removeItem),
]);

List<CartItem> _addItem(List<CartItem> cartList, AddItemAction action) {
  return List.from(cartList)..add(action.cartItem);
}

List<CartItem> _removeItem(List<CartItem> cartList, RemoveItemAction action) {
  return cartList.where((item) => item.id != action.id).toList();
}
