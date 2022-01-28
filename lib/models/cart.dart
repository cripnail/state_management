import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:state_management/models/catalog.dart';

part 'cart.g.dart';

class CartModel = _CartModelBase with _$CartModel;

abstract class _CartModelBase with Store {
  _CartModelBase(this.item);

  final Item item;

  /// The private field backing [catalog].
  late CatalogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  @computed

  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  @computed

  /// The current total price of all items.
  int get total => items.fold(0, (total, current) => total + current.price);
//
// @action
//
// /// Adds [item] to cart. This is the only way to modify the cart from outside.
// void add(Item item) {
//   _itemIds.add(item.id);
// }
}
