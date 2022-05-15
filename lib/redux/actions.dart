
import '../models/cartItem.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class DeleteItemAction {
  final CartItem item;

  DeleteItemAction(this.item);
}
