import '../../models/item.dart';

abstract class ProductService{
  Future<List<Item>> findAll();
}