// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCart on _ShoppingCartBase, Store {
  Computed<int>? _$itemsCountComputed;

  @override
  int get itemsCount =>
      (_$itemsCountComputed ??= Computed<int>(() => super.itemsCount,
              name: '_ShoppingCartBase.itemsCount'))
          .value;
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_ShoppingCartBase.total'))
      .value;

  final _$obsAtom = Atom(name: '_ShoppingCartBase.obs');

  @override
  ObservableList<CartModel> get obs {
    _$obsAtom.reportRead();
    return super.obs;
  }

  @override
  set obs(ObservableList<CartModel> value) {
    _$obsAtom.reportWrite(value, super.obs, () {
      super.obs = value;
    });
  }

  final _$_ShoppingCartBaseActionController =
      ActionController(name: '_ShoppingCartBase');

  @override
  void addItemToCart(Item item) {
    final _$actionInfo = _$_ShoppingCartBaseActionController.startAction(
        name: '_ShoppingCartBase.addProduct');
    try {
      return super.addItemToCart(item);
    } finally {
      _$_ShoppingCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(CartModel item) {
    final _$actionInfo = _$_ShoppingCartBaseActionController.startAction(
        name: '_ShoppingCartBase.removeProduct');
    try {
      return super.removeProduct(item);
    } finally {
      _$_ShoppingCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCart() {
    final _$actionInfo = _$_ShoppingCartBaseActionController.startAction(
        name: '_ShoppingCartBase.updateCart');
    try {
      return super.updateCart();
    } finally {
      _$_ShoppingCartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obs: ${obs},
itemsCount: ${itemsCount},
total: ${total}
    ''';
  }
}
