
import 'package:mobx/mobx.dart';
import 'package:state_management/models/cart.dart';
import 'package:state_management/models/catalog.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store {

  @observable
  Observable<List<CartModel>> cart = Observable as Observable<List<CartModel>>;
}