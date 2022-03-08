import 'package:state_management/shared/services/product_service.dart';
import '../../models/item.dart';

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

class RestProductService implements ProductService {
  @override
  Future<List<Item>> findAll() {
    try {
      return Future.delayed(
          const Duration(seconds: 2), () => _catalog as List<Item>);
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
