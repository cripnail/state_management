import 'package:mobx/mobx.dart';
import 'package:state_management/common/constants.dart';
import 'package:state_management/models/catalog.dart';
import 'package:state_management/shared/services/product_service.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ProductService _productService;
  final CatalogModel catalog = CatalogModel(itemNames: ctl);

  @observable
  ObservableFuture<CatalogModel> products = ObservableFuture.value(
    CatalogModel(itemNames: ctl),
  );

  @computed
  bool get loading => products.status == FutureStatus.pending;

  @computed
  bool get hasError => products.error != null;

  _HomeStoreBase(this._productService);

  @action
  void reload() {
    products = _productService.findAll().asObservable()
        as ObservableFuture<CatalogModel>;
  }
}
