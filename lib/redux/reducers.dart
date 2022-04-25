import '../models/catalog.dart';
import 'actions.dart';

List<Item> cartItemsReducer(List<Item> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is DeleteItemAction) {
    return deleteItem(items, action);
  }
  return items;
}

List<Item> addItem(List<Item> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<Item> deleteItem(List<Item> items, DeleteItemAction action) {
  return List.from(items)..remove(action.item);
}
