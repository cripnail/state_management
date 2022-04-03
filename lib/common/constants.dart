import '../models/catalog.dart';
import '../models/item.dart';

List<String> _ctl = <String>[
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

List<String> get ctl => _ctl;

List<Item> _itemList = <Item>[
  Item(1, 'Code Smell'),
  Item(2, 'Control Flow'),
  Item(3, 'Interpreter'),
  Item(4, 'Recursion'),
  Item(4, 'Sprint'),
  Item(5, 'Heisenbug'),
  Item(6, 'Spaghetti'),
  Item(7, 'Hydra Code'),
  Item(8, 'Hydra Code'),
  Item(9, 'Off-By-One'),
  Item(10, 'Scope'),
  Item(11, 'Closure'),
  Item(12, 'Automata'),
  Item(13, 'Bit Shift'),
  Item(14, 'Currying'),
];

List<Item> get itemList => _itemList;

final elem = _itemList.forEach((e) => e);