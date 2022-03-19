import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../common/constants.dart';
import '../stores/shopping_cart.dart';
import '../models/item.dart';
import '../shared/services/rest_product_service.dart';
import '../stores/home_store.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late HomeStore _homeStore;
  late ShoppingCart _counterStore;

  @override
  void initState() {
    _homeStore = HomeStore(RestProductService());
    _counterStore = ShoppingCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      _MyAppBar(),
      const SliverToBoxAdapter(child: SizedBox(height: 12)),
      Observer // track the status of the catalog download
          (builder: (_) {
        if (_homeStore.hasError) {
          return const SliverFillRemaining(
            child: Center(
              child: Text("An error has occurred"),
            ),
          );
        } else if (_homeStore.loading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _CatalogListItem(
                product: _homeStore.catalog.getByPosition(index),
              ),
              childCount:
                  _homeStore.catalog.itemNames.length, // Set catalog length
            ),
          );
        }
      })
    ]));
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key? key, required this.product}) : super(key: key);
  final Item product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Observer(
      builder: (_) {
        final _homeStore = HomeStore(RestProductService());
        final _counterStore = ShoppingCart();
        if (_homeStore.hasError) {
          return const Center(
            child: Text("An error has occurred"),
          );
        } else if (_homeStore.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return TextButton(
            style: TextButton.styleFrom(onSurface: theme.primaryColor),
            onPressed: _counterStore.isInCart(_counterStore.cat)
                ? null
                : () => _counterStore.add(_counterStore.cat),
            child: _counterStore.isInCart(_counterStore.cat)
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
          );
        }
      },
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

class _CatalogListItem extends StatelessWidget {
  const _CatalogListItem({Key? key, required this.product}) : super(key: key);
  final Item product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    final _counterStore = ShoppingCart();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
            maxHeight: 48,
            child: Row(
              children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: ColoredBox(color: _counterStore.cat.color)),
                const SizedBox(width: 24),
                Expanded(child: Text(_counterStore.cat.name, style: textTheme)),
                const SizedBox(width: 24),
                _AddButton(product: product),
              ],
            )));
  }
}
