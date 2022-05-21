import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../data/models/app_state.dart';
import '../../data/models/cartItem.dart';
import '../../domain/actions/cart_action.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // products is a static list
  List<Map> products = [
    {
      'id': 1,
      'name': 'Code Smell',
      'price': '42\$',
      'color': Colors.deepPurpleAccent,
    },
    {
      'id': 2,
      'name': 'Control Flow',
      'price': '42\$',
      'color': Colors.blueGrey,
    },
    {
      'id': 3,
      'name': 'Interpreter',
      'price': '42\$',
      'color': Colors.redAccent,
    },
    {
      'id': 4,
      'name': 'Recursion',
      'price': '42\$',
      'color': Colors.green,
    },
    {
      'id': 5,
      'name': 'Sprint',
      'price': '42\$',
      'color': Colors.blueGrey,
    },
    {
      'id': 6,
      'name': 'Spaghetti',
      'price': '42\$',
      'color': Colors.lightBlueAccent,
    },
    {
      'id': 7,
      'name': 'Hydra Code',
      'price': '42\$',
      'color': Colors.pink,
    },
    {
      'id': 8,
      'name': 'Off-By-One',
      'price': '42\$',
      'color': Colors.brown,
    },
    {
      'id': 9,
      'name': 'Scope',
      'price': '42\$',
      'color': Colors.deepOrangeAccent,
    },
    {
      'id': 10,
      'name': 'Closure',
      'price': '42\$',
      'color': Colors.orangeAccent,
    },
    {
      'id': 11,
      'name': 'Automata',
      'price': '42\$',
      'color': Colors.orange,
    },
    {
      'id': 12,
      'name': 'Bit Shift',
      'price': '42\$',
      'color': Colors.lightGreenAccent,
    },
    {
      'id': 13,
      'name': 'Currying',
      'price': '42\$',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (_, _ViewModel _viewModel) {
              return CustomScrollView(slivers: [
                _MyAppBar(),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          NotificationListener<OverscrollIndicatorNotification>(
                            onNotification: (overScroll) {
                              overScroll.disallowIndicator();
                              return true;
                            },
                            child: _CatalogListItem(
                                item: products[index], viewModel: _viewModel),
                          ),
                      childCount: products.length),
                )
              ]);
            }));
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Catalog'),
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

bool _isSelected(Map productItem, List cartList) {
  List filterList =
      cartList.where((item) => item.id == productItem['id']).toList();
  if (kDebugMode) {
    print('filterList: ${filterList.length}');
  }
  return filterList.isNotEmpty ? true : false;
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key? key, required this.viewModel, required this.item})
      : super(key: key);

  final _ViewModel viewModel;
  final Map item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isSelected = _isSelected(item, viewModel.cartList);
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (_, _ViewModel _viewModel) {
          return TextButton(
            style: TextButton.styleFrom(onSurface: theme.primaryColor),
            onPressed: isSelected
                ? null
                : () => viewModel.onPressedCallback(item: item),
            child: isSelected
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          );
        });
  }
}

class _CatalogListItem extends StatelessWidget {
  const _CatalogListItem({required this.item, required this.viewModel});

  final Map item;
  final _ViewModel viewModel;

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
                    aspectRatio: 1,
                    child: ColoredBox(color: item['color'] as Color)),
                const SizedBox(width: 24),
                Expanded(child: Text('${item['name']}', style: textTheme)),
                const SizedBox(width: 24),
                _AddButton(item: item, viewModel: viewModel),
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
