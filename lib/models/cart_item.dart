
import 'package:flutter/material.dart';

class CartItem {
  int id;
  String name;
  Color color;
  final int price = 42;

  CartItem({
    required this.id,
    required this.name,
  }) : color = Colors.primaries[id % Colors.primaries.length];

  static CartItem fromMap(Map item) {
    return CartItem(
      id: item['id'],
      name: item['name'],
    );
  }
}
