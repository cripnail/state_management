// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartItem on _CartItemBase, Store {
  Computed<num>? _$totalComputed;

  @override
  num get total => (_$totalComputed ??=
          Computed<num>(() => super.total, name: '_CartItemBase.total'))
      .value;

  @override
  String toString() {
    return '''
total: ${total}
    ''';
  }
}
