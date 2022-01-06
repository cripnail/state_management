import 'package:state_management/models/cart.dart';

class GetCatalogAction {
  final List<CartModel> catalog;

  GetCatalogAction(this.catalog);
}

class ToggleStateItemsAction {
  final List<CartModel> items;

  ToggleStateItemsAction(this.items);
}

class AddItemsAction {
  final List<CartModel> items;

  AddItemsAction(this.items);
}

class DeleteItemsAction {
  final List<CartModel> items;

  DeleteItemsAction(this.items);
}
