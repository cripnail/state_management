import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/cart_action.dart';
import '../models/appState.dart';
import '../models/cartItem.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  Widget _buildCartItem(
      {required CartItem item,
      required _ViewModel viewModel,
      required BuildContext context}) {
    return ListTile(
        leading: const Icon(Icons.done),
        title: Text(item.name
            // style: itemNameStyle,
            ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            viewModel.deleteItemCallback(item: item);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    // final itemNameStyle = Theme.of(context).textTheme.headline6;

    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (_, _ViewModel _viewModel) {
          if (_viewModel.cartList.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          } else {
            return ListView.builder(
              itemCount: _viewModel.cartList.length,
              itemBuilder: (_, index) => _buildCartItem(
                  item: _viewModel.cartList[index],
                  viewModel: _viewModel,
                  context: context),
            );
          }
        });
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (_, _ViewModel _viewModel) {
          final total = _viewModel.cartList.fold<int>(0, (i, element) {
            return i + element.price;
          });
          return SizedBox(
            height: 200,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${total.toStringAsFixed(2)}', style: hugeStyle),
                  const SizedBox(width: 24),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Buying not supported yet.')));
                    },
                    style: TextButton.styleFrom(primary: Colors.white),
                    child: const Text('BUY'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _ViewModel {
  final List<CartItem> cartList;
  final Function deleteItemCallback;

  _ViewModel({required this.cartList, required this.deleteItemCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        cartList: store.state.cartList,
        deleteItemCallback: ({required CartItem item}) {
          debugPrint('_ViewModel redux - item: ${item.toString()}');
          return store.dispatch(RemoveItemAction(item.id));
        });
  }
}
