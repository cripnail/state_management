import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/stores/cart_store.dart';
import '../common/extensions.dart';
import '../stores/empty_state.dart';
import '../stores/home_controller.dart';

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
  late final ShoppingCart shoppingCart;

  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    final cart = shoppingCart.obs;

    return Observer(builder: (_) {
      final controller = HomeController();
      if (controller.appStatus == AppStatus.loading) {
        return const CircularProgressIndicator();
      } else if (controller.appStatus == AppStatus.success) {
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
      } else if (controller.appStatus == AppStatus.empty) {
        return const EmptyState();
      } else if (controller.appStatus == AppStatus.error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "There was a problem!",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Colors.red),
              ),
              Text(
                controller.errorMessage.isNotEmpty
                    ? controller.errorMessage
                    : controller.appStatus.message(),
              ),
            ],
          ),
        );
      }
      return const EmptyState();
    });
  }
}

class _CartTotal extends StatelessWidget {
  late final ShoppingCart shoppingCart;

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
            Observer(builder: (_) {
              final controller = HomeController();
              if (controller.appStatus == AppStatus.loading) {
                return const CircularProgressIndicator();
              } else if (controller.appStatus == AppStatus.success) {
                return Text('\$${shoppingCart.total.toStringAsFixed(2)}',
                    style: hugeStyle);
              } else if (controller.appStatus == AppStatus.empty) {
                return const EmptyState();
              } else if (controller.appStatus == AppStatus.error) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "There was a problem!",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.red),
                      ),
                      Text(
                        controller.errorMessage.isNotEmpty
                            ? controller.errorMessage
                            : controller.appStatus.message(),
                      ),
                    ],
                  ),
                );
              }
              return const EmptyState();
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
