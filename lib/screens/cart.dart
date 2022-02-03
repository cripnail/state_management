import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/store/cart_store.dart';

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

class _CartList extends StatefulWidget {
  late final ShoppingCart shoppingCart;

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    final cart = widget.shoppingCart.obs;

    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              final cartItem = cart[index];
              cart.remove(cartItem);
            },
          ),
          title: Text(
            cart.name,
            style: itemNameStyle,
          ),
        ),
      );
    });
  }
}

class _CartTotal extends StatefulWidget {
  late final ShoppingCart shoppingCart;

  @override
  State<_CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<_CartTotal> {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
    Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
                builder: (_) => Text(
                    '\$${widget.shoppingCart.total.toStringAsFixed(2)}',
                    style: hugeStyle)),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(primary: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
