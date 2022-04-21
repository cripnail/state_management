import 'package:mobx/mobx.dart';
import 'package:state_management/models/item.dart';

part 'cart_item.g.dart';

class CartItem = _CartItemBase with _$CartItem;

abstract class _CartItemBase with Store {
  _CartItemBase(this.product);

  final Item product;

  @computed
  num get total => product.price;

  @override
  int get hashCode => product.hashCode;

  @override
  bool operator ==(other) => other is CartItem && other.product == product;
}
