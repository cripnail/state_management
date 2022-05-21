import '../../data/models/cartItem.dart';

class AddItemAction {
  CartItem cartItem;

  AddItemAction(this.cartItem);
}

class RemoveItemAction {
  int id;

  RemoveItemAction(this.id);
}


