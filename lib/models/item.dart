import 'package:flutter/material.dart';

class Item {
  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  final int id;
  final String name;
  final Color color;
  final int price = 42;

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
