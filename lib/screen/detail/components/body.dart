import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_example/bloc/cart_bloc.dart';
import 'package:shop_app_example/event/cart_event/add_cart_item_event.dart';
import 'package:shop_app_example/models/product.dart';

import '../../../constants.dart';

class DetailBody extends StatelessWidget {
  final Product _product;

  const DetailBody(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Image.network(
                  _product.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(_product.colorCode),
                  borderRadius: BorderRadius.circular(16)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _product.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    "\$${_product.price}",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                _product.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Consumer<CartBloc>(
              builder: (ctx, bloc, child) {
                return ElevatedButton.icon(
                  onPressed: () {
                    bloc.event.add(AddCartItemEvent(_product.id));
                  },
                  label: const Text("Add to cart"),
                  icon: const Icon(Icons.shopping_cart),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
