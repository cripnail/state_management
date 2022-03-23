import 'package:state_management/models/catalog.dart';

import '../models/item.dart';

List _itemList = <Item>[
  Item(1, 'Code Smell'),
  Item(2, 'Control Flow'),
  Item(3, 'Interpreter'),
  Item(4, 'Recursion'),
  Item(5, 'Sprint'),
  Item(6, 'Heisenbug'),
  Item(7, 'Spaghetti'),
  Item(8, 'Hydra Code'),
  Item(9, 'Off-By-One'),
  Item(10, 'Off-By-One'),
  Item(11, 'Scope'),
  Item(12, 'Callback'),
  Item(13, 'Closure'),
  Item(14, 'Automata'),
  Item(15, 'Bit Shift'),
  Item(16, 'Currying'),
];

get itemList => _itemList;

List<CatalogModel> _ctl = [
  CatalogModel(itemNames: [
    'Code Smell',
  ]),
  CatalogModel(itemNames: [
    'Control Flow',
  ]),
  CatalogModel(itemNames: [
    'Interpreter',
  ]),
  CatalogModel(itemNames: [
    'Recursion',
  ]),
  CatalogModel(itemNames: [
    'Sprint',
  ]),
  CatalogModel(itemNames: [
    'Sprint',
  ]),
  CatalogModel(itemNames: [
    'Heisenbug',
  ]),
  CatalogModel(itemNames: [
    'Spaghetti',
  ]),
  CatalogModel(itemNames: [
    'Hydra Code',
  ]),
  CatalogModel(itemNames: [
    'Off-By-One',
  ]),
  CatalogModel(itemNames: [
    'Scope',
  ]),
  CatalogModel(itemNames: [
    'Callback',
  ]),
  CatalogModel(itemNames: [
    'Closure',
  ]),
  CatalogModel(itemNames: [
    'Automata',
  ]),
  CatalogModel(itemNames: [
    'Bit Shift',
  ]),
  CatalogModel(itemNames: [
    'Currying',
  ]),
];

get ctl => _ctl;
