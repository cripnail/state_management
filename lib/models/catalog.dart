import 'package:mobx/mobx.dart';
import 'item.dart';

part 'catalog.g.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
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
