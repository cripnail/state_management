import 'package:state_management/common/constants.dart';
import 'package:state_management/models/item.dart';
import 'package:state_management/shared/services/product_service.dart';

class RestProductService implements ProductService {
  // final ShoppingCart _counterStore = ShoppingCart();

  @override
  Future<List<Item>> findAll() {
    try {
      return Future.delayed(const Duration(seconds: 2), () => itemList);
    } catch (e) {
      rethrow;
    }
  }
}
