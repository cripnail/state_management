// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartModel on _CartModelBase, Store {
  Computed<List<Item>>? _$itemsComputed;

  @override
  List<Item> get items => (_$itemsComputed ??=
          Computed<List<Item>>(() => super.items, name: '_CartModelBase.items'))
      .value;
  Computed<int>? _$totalComputed;

  @override
  int get total => (_$totalComputed ??=
          Computed<int>(() => super.total, name: '_CartModelBase.total'))
      .value;

  final _$_CartModelBaseActionController =
      ActionController(name: '_CartModelBase');

  @override
  void add(Item item) {
    final _$actionInfo = _$_CartModelBaseActionController.startAction(
        name: '_CartModelBase.add');
    try {
      return super.add(item);
    } finally {
      _$_CartModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
total: ${total}
    ''';
  }
}
