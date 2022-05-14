import '../models/catalog.dart';

class AddItemAction {
  final Item item;

  AddItemAction(this.item);
}

class DeleteItemAction {
  final Item item;

  DeleteItemAction(this.item);
}
