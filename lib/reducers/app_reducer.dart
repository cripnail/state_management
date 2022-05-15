import '../models/appState.dart';
import 'cart_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(cartList: cartListReducer(state.cartList, action));
}
