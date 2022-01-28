import 'package:mobx/mobx.dart';
import '../models/cart.dart';
import '../models/catalog.dart';

part 'cart_store.g.dart';

class ShoppingCart = _ShoppingCartBase with _$ShoppingCart;

abstract class _ShoppingCartBase with Store {
  @observable
  ObservableList<CartModel> obs = <CartModel>[].asObservable();

  @computed
  int get itemsCount => obs.length;

  @computed
  double get total =>
      obs.fold(0, (previousValue, element) => previousValue + element.total);

  @action
  void addProduct(Item item) {
    obs.add(CartModel(item));
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
    if (obs.contains(CartModel(item))) {
      return true;
    }
    return false;
  }
}
