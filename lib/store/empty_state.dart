
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Products currently unavailable!",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}