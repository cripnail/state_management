import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management/stores/home_store.dart';
import 'package:state_management/stores/shopping_cart.dart';


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
  @override
  Widget build(BuildContext context) {
    final itemNameStyle = Theme.of(context).textTheme.headline6;
    final shoppingCart = Provider.of<ShoppingCart>(context);
    final _homeStore = Provider.of<HomeStore>(context);
    final cart = shoppingCart.obs;

    return Observer(builder: (_) {
      if (_homeStore.hasError) {
        return const Center(
          child: Text('An error has occurred'),
        );
      } else if (_homeStore.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
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
      }
    });
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);
    final _cartStore = Provider.of<ShoppingCart>(context);
    final _homeStore = Provider.of<HomeStore>(context);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              // final _homeStore = HomeStore(RestProductService());
              if (_homeStore.hasError) {
                return const Center(
                  child: Text('An error has occurred'),
                );
              } else if (_homeStore.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Text('\$${_cartStore.total.toStringAsFixed(2)}',
                    style: hugeStyle);
              }
            }),
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
