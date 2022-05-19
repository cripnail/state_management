import '../models/app_state.dart';
import 'cart_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(cartList: cartListReducer(state.cartList, action));
}
