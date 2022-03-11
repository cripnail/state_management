import 'package:state_management/shared/services/product_service.dart';
import '../../models/item.dart';
import '../../stores/shopping_cart.dart';

class RestProductService implements ProductService {
  final ShoppingCart _counterStore = ShoppingCart();

  @override
  Future<List<Item>> findAll() {
    try {
      return Future.delayed(
          const Duration(seconds: 2), () => _counterStore.cat);
      //     List<Product>.generate(
      //         10,
      //         (index) =>
      //             Product("$index", "product $index", (index * 35.951 / 2.5)))
      // );
    } catch (e) {
      rethrow;
    }
  }
}
