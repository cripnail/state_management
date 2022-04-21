import 'package:mobx/mobx.dart';
import 'package:state_management/models/item.dart';

part 'catalog.g.dart';

class CatalogModel = _CatalogModelBase with _$CatalogModel;

abstract class _CatalogModelBase with Store {
  _CatalogModelBase({required this.itemNames});

  @observable
  List<String> itemNames;

  @action
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  @action
  Item getByPosition(int position) => getById(position);
}
