import 'package:mobx/mobx.dart';
import 'item.dart';

part 'cart.g.dart';

class CartModel = _CartModelBase with _$CartModel;

abstract class _CartModelBase with Store {
  _CartModelBase({this.items = const <Item>[]});

  final List<Item> items;

  @observable
  ObservableList<CartModel> obs = <CartModel>[].asObservable();

  @computed

  /// The current total price of all items.
  int get total => items.fold(0, (total, current) => total + current.price);

  @action
  void addItemToCart(Item item) {
    obs.add(CartModel());
  }

  @action
  void removeProduct(CartModel item) {
    obs.remove(item);
  }

  @action
  void updateCart() {
    obs.length;
  }

  bool isInCart(Item item) {
    if (obs.contains(CartModel())) {
      return true;
    }
    return false;
  }
}
