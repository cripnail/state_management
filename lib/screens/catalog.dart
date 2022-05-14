import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/appState.dart';
import '../models/cartItem.dart';
import '../redux/actions.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  // products is a static list
  List<Map> products = [
    {'id': 1, 'name': 'Code Smell', 'price': '42\$'},
    {'id': 2, 'name': 'Control Flow', 'price': '42\$'},
    {'id': 3, 'name': 'Interpreter', 'price': '42\$'},
    {'id': 4, 'name': 'Recursion', 'price': '42\$'},
    {'id': 5, 'name': 'Sprint', 'price': '42\$'},
    {'id': 6, 'name': 'Heisenbug', 'price': '42\$'},
    {'id': 7, 'name': 'Spaghetti', 'price': '42\$'},
    {'id': 8, 'name': 'Hydra Code', 'price': '42\$'},
    {'id': 9, 'name': 'Off-By-One', 'price': '42\$'},
    {'id': 10, 'name': 'Scope', 'price': '42\$'},
    {'id': 11, 'name': 'Callback', 'price': '42\$'},
    {'id': 12, 'name': 'Closure', 'price': '42\$'},
    {'id': 13, 'name': 'Automata', 'price': '42\$'},
    {'id': 14, 'name': 'Bit Shift', 'price': '42\$'},
    {'id': 15, 'name': 'Currying', 'price': '42\$'},
  ];

// is a function to check if product item is added to cart before or not
  bool _isSelected(Map productItem, List cartList) {
    List filterList =
        cartList.where((item) => item.id == productItem['id']).toList();
    if (kDebugMode) {
      print('filterList: ${filterList.length}');
    }
    return filterList.isNotEmpty ? true : false;
  }

  Widget _addButton({required Map item, required _ViewModel viewModel}) {
    bool isSelected = _isSelected(item, viewModel.cartList);
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (_, _ViewModel _viewModel) {
          return TextButton(
            // style: TextButton.styleFrom(onSurface: theme.primaryColor),
            onPressed: isSelected
                ? null
                : () => viewModel.onPressedCallback(item: item),
            child: isSelected
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (_, _ViewModel _viewModel) {
              return CustomScrollView(
                slivers: [
                  _MyAppBar(),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _myListItem(
                          item: products[index], viewModel: _viewModel),
                      childCount: products.length,
                    ),
                  ),
                ],
              );
            }));
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.headline1),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}

// class _MyListItem extends StatelessWidget {
//   final int index;
//
//   const _MyListItem(this.index, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme.headline6;
//     var item = context.select<CatalogModel, Item>(
//       // Here, we are only interested in the item at [index]. We don't care
//       // about any other change.
//       (catalog) => catalog.getByPosition(index),
//     );

Widget _myListItem({required Map item, required _ViewModel viewModel}) {
  bool isSelected = _isSelected(item, viewModel.cartList);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: LimitedBox(
      maxHeight: 48,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: item.color,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Text(item.name, style: textTheme),
          ),
          const SizedBox(width: 24),
          _AddButton(
            item: item,
            items: const [],
          ),
        ],
      ),
    ),
  );
}

class _ViewModel {
  final List<CartItem> cartList;
  final Function onPressedCallback;

  _ViewModel({required this.cartList, required this.onPressedCallback});

  // when state updates, it will recreate this _ViewModel
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        cartList: store.state.cartList,
        onPressedCallback: ({required Map item}) {
          return store.dispatch(AddItemAction(CartItem.fromMap(item)));
        });
  }
}
