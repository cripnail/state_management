import 'package:mobx/mobx.dart';
import 'item.dart';
part 'cart_item.g.dart';

class CartItem = _CartItemBase with _$CartItem;

abstract class _CartItemBase with Store {
  _CartItemBase(this.product);

  final Item product;

  // @observable
  // num quantity = 1;

  @computed
  num get total => product.price;
  //
  // @action
  // void increment() {
  //   quantity++;
  // }

  // @action
  // void decrement() {
  //   if (quantity > 1) {
  //     quantity--;
  //   }
  // }

  @override
  int get hashCode => product.hashCode;

  @override
  bool operator ==(other) => other is CartItem && other.product == product;
}
