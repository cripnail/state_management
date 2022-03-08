import 'package:mobx/mobx.dart';
import '../models/cart_item.dart';
import '../models/item.dart';
part 'shopping_cart.g.dart';

const List<dynamic> _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class ShoppingCart = _ShoppingCartBase with _$ShoppingCart;

abstract class _ShoppingCartBase with Store {
  @observable
  ObservableList<CartItem> obs = <CartItem>[].asObservable();

  @computed
  int get itemsCount => obs.length;

  @computed
  double get total =>
      obs.fold(0, (previousValue, element) => previousValue + element.total);

  @action
  void add(Item item) {
    obs.add(CartItem(item));
  }

  @action
  void remove(Item item) {
    obs.remove(item);
  }

  bool isInCart(Item product) {
    if (obs.contains(CartItem(product))) {
      return true;
    }
    return false;
  }
  get cat => _catalog;
}