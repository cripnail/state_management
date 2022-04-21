import 'package:state_management/models/item.dart';

abstract class ProductService {
  Future<List<Item>> findAll();
}
