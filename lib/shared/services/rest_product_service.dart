import 'package:state_management/shared/services/product_service.dart';
import '../../common/constants.dart';
import '../../models/item.dart';
import '../../stores/shopping_cart.dart';

class RestProductService implements ProductService {
  // final ShoppingCart _counterStore = ShoppingCart();

  @override
  Future<List<Item>> findAll() {
    try {
      return Future.delayed(
          const Duration(seconds: 2), () => ctl);
    } catch (e) {
      rethrow;
    }
  }
}
