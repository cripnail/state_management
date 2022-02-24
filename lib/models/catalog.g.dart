// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatalogModel on _CatalogModelBase, Store {
  final _$itemNamesAtom = Atom(name: '_CatalogModelBase.itemNames');

  @override
  List<String> get itemNames {
    _$itemNamesAtom.reportRead();
    return super.itemNames;
  }

  @override
  set itemNames(List<String> value) {
    _$itemNamesAtom.reportWrite(value, super.itemNames, () {
      super.itemNames = value;
    });
  }

  final _$_CatalogModelBaseActionController =
      ActionController(name: '_CatalogModelBase');

  @override
  Item getById(int id) {
    final _$actionInfo = _$_CatalogModelBaseActionController.startAction(
        name: '_CatalogModelBase.getById');
    try {
      return super.getById(id);
    } finally {
      _$_CatalogModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Item getByPosition(int position) {
    final _$actionInfo = _$_CatalogModelBaseActionController.startAction(
        name: '_CatalogModelBase.getByPosition');
    try {
      return super.getByPosition(position);
    } finally {
      _$_CatalogModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemNames: ${itemNames}
    ''';
  }
}
