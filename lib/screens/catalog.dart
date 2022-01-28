import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/models/cart.dart';
import 'package:state_management/store/cart_store.dart';
import 'package:state_management/models/catalog.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((context, index) => _MyListItem(
                      index,
                    )),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatefulWidget {
  const _AddButton({
    Key? key,
  }) : super(key: key);

  @override
  State<_AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<_AddButton> {
  final cartController = ShoppingCart();
  late final Item item;

  void updateCart(Item item) {
    if (cartController.isInCart(item)) {
      cartController.removeProduct(
        CartModel(item),
      );
    } else {
      cartController.addProduct(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: cartController.isInCart(item)
          ? null
          : () {
              // If the item is not in cart, we let the user add it.
              cartController.addProduct(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: cartController.isInCart(item)
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
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

class _MyListItem extends StatelessWidget {
  final CartModel? items;
  final Item? item;

  const _MyListItem(int index, {Key? key, this.items, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var cartItem = context<CatalogModel, Item>(
    //   (catalog) => catalog.getByPosition(index),
    // );
    var textTheme = Theme.of(context).textTheme.headline6;

    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
          maxHeight: 48,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: items?.item.color,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(items!.item.name, style: textTheme),
              ),
              const SizedBox(width: 24),
              const _AddButton(),
            ],
          ),
        ),
      );
    });
  }
}
