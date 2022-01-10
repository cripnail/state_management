// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartModel on _CartModel, Store {
  Computed<List<Item>>? _$itemsComputed;

  @override
  List<Item> get items => (_$itemsComputed ??=
          Computed<List<Item>>(() => super.items, name: '_CartModel.items'))
      .value;
  Computed<int>? _$totalPriceComputed;

  @override
  int get totalPrice => (_$totalPriceComputed ??=
          Computed<int>(() => super.totalPrice, name: '_CartModel.totalPrice'))
      .value;

  final _$_CartModelActionController = ActionController(name: '_CartModel');

  @override
  void add(Item item) {
    final _$actionInfo =
        _$_CartModelActionController.startAction(name: '_CartModel.add');
    try {
      return super.add(item);
    } finally {
      _$_CartModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Item item) {
    final _$actionInfo =
        _$_CartModelActionController.startAction(name: '_CartModel.remove');
    try {
      return super.remove(item);
    } finally {
      _$_CartModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
totalPrice: ${totalPrice}
    ''';
  }
}
