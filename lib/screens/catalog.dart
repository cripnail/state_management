import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:state_management/models/item.dart';
import 'package:state_management/shared/services/rest_product_service.dart';
import 'package:state_management/stores/home_store.dart';
import 'package:state_management/stores/shopping_cart.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late HomeStore _homeStore;

  @override
  void initState() {
    _homeStore = HomeStore(RestProductService());

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
              child: Text('An error has occurred'),
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
  const _AddButton({
    required this.product,
    Key? key,
  }) : super(key: key);
  final Item product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _counterStore = Provider.of<ShoppingCart>(context);
    final _homeStore = Provider.of<HomeStore>(context);

    return Observer(
      builder: (_) {
        if (_homeStore.hasError) {
          return const Center(
            child: Text('An error has occurred'),
          );
        } else if (_homeStore.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return TextButton(
            style: TextButton.styleFrom(onSurface: theme.primaryColor),
            onPressed: _counterStore.isInCart(product)
                ? null
                : () => _counterStore.add(product),
            child: _counterStore.isInCart(product)
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

class _CatalogListItem extends StatelessWidget {
  const _CatalogListItem({
    required this.product,
    Key? key,
  }) : super(key: key);
  final Item product;

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
                    aspectRatio: 1, child: ColoredBox(color: product.color)),
                const SizedBox(width: 24),
                Expanded(child: Text(product.name, style: textTheme)),
                const SizedBox(width: 24),
                _AddButton(product: product),
              ],
            )));
  }
}
