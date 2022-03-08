import 'package:mobx/mobx.dart';
import '../models/item.dart';
import '../shared/services/product_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ProductService _productService;

  @observable
  ObservableFuture<List<Item>?> products = ObservableFuture.value(null);

  @computed
  bool get loading => products.status == FutureStatus.pending;

  @computed
  bool get hasError => products.error != null;

  _HomeStoreBase(this._productService);
  
  @action
  void reload(){
    products = _productService.findAll().asObservable();
  }
  // void addItemToCart(Item product) =>  products.add(product);
  
}