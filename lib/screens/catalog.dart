import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/common/extensions.dart';
import 'package:state_management/stores/empty_state.dart';
import '../models/item.dart';
import '../stores/cart_store.dart';
import '../stores/empty_state.dart';
import '../stores/home_controller.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final controller = HomeController();
  final cartController = ShoppingCart();

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          Observer // отслеживаем статус загрузки каталога
              (
            builder: (_) {
              final controller = HomeController();
              if (controller.appStatus == AppStatus.loading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (controller.appStatus == AppStatus.success) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _CatalogListItem(controller.catalog
                            .getByPosition(index) // задаем элемент каталога
                        ),
                    childCount:
                        controller.catalog.length, // Задаем длину каталога
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
            },
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Observer(
      builder: (_) {
        final controller = HomeController();
        if (controller.appStatus == AppStatus.loading) {
          return const CircularProgressIndicator();
        } else if (controller.appStatus == AppStatus.success) {
          final cartController = ShoppingCart();
          return TextButton(
            style: TextButton.styleFrom(onSurface: theme.primaryColor),
            onPressed: cartController.isInCart(item)
                ? null
                : () => cartController.addItemToCart(item),
            child: cartController.isInCart(item)
                ? const Icon(Icons.check, semanticLabel: 'ADDED')
                : const Text('ADD'),
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
  const _CatalogListItem(this.item, {Key? key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Observer(builder: (_) {
          final controller = HomeController();
          if (controller.appStatus == AppStatus.loading) {
            return const CircularProgressIndicator();
          } else if (controller.appStatus == AppStatus.success) {
            return Row(
              children: [
                AspectRatio(
                    aspectRatio: 1, child: ColoredBox(color: item.color)),
                const SizedBox(width: 24),
                Expanded(child: Text(item.name, style: textTheme)),
                const SizedBox(width: 24),
                _AddButton(item: item),
              ],
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
        }),
      ),
    );
  }
}
