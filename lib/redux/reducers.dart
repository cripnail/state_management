import 'package:state_management/state/app_state.dart';
import 'package:state_management/models/cart.dart';
import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
      catalog: catalogReducer(state.catalog, action),
      items: items(state.items, action));
}

List<CartModel> catalogReducer(List<CartModel> catalog, dynamic action) {
  if (action is GetCatalogAction) {
    return action.catalog;
  }
  return catalog;
}

List<CartModel> items(List<CartModel> items, dynamic action) {
  if (action is
      // ToggleCartProductAction
      ToggleStateItemsAction) {
    return action.items;
  }
  return items;
}
