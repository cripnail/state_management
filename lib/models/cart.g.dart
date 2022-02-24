// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartModel on _CartModelBase, Store {
  Computed<int>? _$totalComputed;

  @override
  int get total => (_$totalComputed ??=
          Computed<int>(() => super.total, name: '_CartModelBase.total'))
      .value;

  final _$obsAtom = Atom(name: '_CartModelBase.obs');

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

  final _$_CartModelBaseActionController =
      ActionController(name: '_CartModelBase');

  @override
  void addItemToCart(Item item) {
    final _$actionInfo = _$_CartModelBaseActionController.startAction(
        name: '_CartModelBase.addItemToCart');
    try {
      return super.addItemToCart(item);
    } finally {
      _$_CartModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(CartModel item) {
    final _$actionInfo = _$_CartModelBaseActionController.startAction(
        name: '_CartModelBase.removeProduct');
    try {
      return super.removeProduct(item);
    } finally {
      _$_CartModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCart() {
    final _$actionInfo = _$_CartModelBaseActionController.startAction(
        name: '_CartModelBase.updateCart');
    try {
      return super.updateCart();
    } finally {
      _$_CartModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obs: ${obs},
total: ${total}
    ''';
  }
}
