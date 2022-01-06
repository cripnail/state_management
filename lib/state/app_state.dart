import 'package:state_management/models/cart.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<CartModel> catalog;
  final List<CartModel> items;

  const AppState({
    required this.catalog,
    required this.items,
  });

  factory AppState.initial() {
    return const AppState(catalog: [], items: []);
  }
}
