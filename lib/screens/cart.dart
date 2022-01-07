import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_management/models/cart.dart';
import 'package:state_management/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key, required this.store, required this.cart})
      : super(key: key);
  final Store<AppState, CartModel> store;
  final CartModel cart;

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
                child: _CartList(
                  cart: cart,
                ),
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
  final CartModel cart;

  const _CartList({required this.cart});

  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  cart.remove(cart.items[index]);
                },
              ),
              title: Text(
                cart.items[index].name,
                style: itemNameStyle,
              ),
            ),
          );
        });
  }
}

class _CartTotal extends StatelessWidget {
  late final CartModel cart;

  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${cart.totalPrice}', style: hugeStyle),
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
