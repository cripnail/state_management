import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/cart_action.dart';
import '../models/app_state.dart';
import '../models/cart_item.dart';
import '../widgets/app_bar.dart';

/*
this is the home screen of this project
*/

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // products is a static list
  List<Map> products = [
    {'id': 1, 'name': 'Code Smell', 'price': '42\$'},
    {'id': 2, 'name': 'Control Flow', 'price': '42\$'},
    {'id': 3, 'name': 'Interpreter', 'price': '42\$'},
    {'id': 4, 'name': 'Recursion', 'price': '42\$'},
    {'id': 5, 'name': 'Sprint', 'price': '42\$'},
    {'id': 6, 'name': 'Spaghetti', 'price': '42\$'},
    {'id': 7, 'name': 'Hydra Code', 'price': '42\$'},
    {'id': 8, 'name': 'Hydra Code', 'price': '42\$'},
    {'id': 9, 'name': 'Off-By-One', 'price': '42\$'},
    {'id': 10, 'name': 'Scope', 'price': '42\$'},
    {'id': 11, 'name': 'Closure', 'price': '42\$'},
    {'id': 12, 'name': 'Automata', 'price': '42\$'},
    {'id': 13, 'name': 'Bit Shift', 'price': '42\$'},
    {'id': 14, 'name': 'Currying', 'price': '42\$'},
  ];

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

    return TextButton(
      // style: TextButton.styleFrom(onSurface: theme.primaryColor),
      onPressed:
          isSelected ? null : () => viewModel.onPressedCallback(item: item),
      child: isSelected
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (_, _ViewModel _viewModel) {
              return CustomScrollView(slivers: [
                HomeAppBar(),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => _CatalogListItem(
                          item: products[index], viewModel: _viewModel),
                      childCount: products.length),
                )
              ]);
            }));
  }
}

class _CatalogListItem extends StatelessWidget {
  const _CatalogListItem(
      {Key? key, required Map item, required _ViewModel viewModel})
      : super(key: key);

  get item => item.id;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
            maxHeight: 48,
            child: Row(
              children: [
                AspectRatio(
                    aspectRatio: 1, child: ColoredBox(color: item.color)),
                const SizedBox(width: 24),
                Expanded(child: Text('${item['name']}', style: textTheme)),
                const SizedBox(width: 24),
                _addButton(viewModel: _viewModel),
              ],
            )));
  }
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
