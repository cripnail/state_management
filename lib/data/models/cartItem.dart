
import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  CartItem({
    required this.id,
    required this.name, required color,
  }) : color = Colors.primaries[id % Colors.primaries.length];

  static CartItem fromMap(Map item) {
    return CartItem(
      id: item['id'],
      name: item['name'],
      color: item['color'],
    );
  }
}
