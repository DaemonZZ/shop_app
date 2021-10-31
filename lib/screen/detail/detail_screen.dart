import 'package:flutter/material.dart';
import 'package:shop_app_example/models/product.dart';
import 'components/body.dart';

class Detail extends StatelessWidget {
  final Product _product;

  const Detail(this._product, {Key? key}) : super(key: key);

  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      leading: IconButton(
        icon: const IconTheme(
            data: IconThemeData(color: Colors.black54),
            child: Icon(Icons.arrow_back)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        _product.title,
        style: Theme.of(context).textTheme.headline4,
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const IconTheme(
              data: IconThemeData(color: Colors.black54),
              child: Icon(Icons.search),
            )),
        IconButton(
            onPressed: () {

            },
            icon: const IconTheme(
              data: IconThemeData(color: Colors.black54),
              child: Icon(Icons.shopping_cart),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: DetailBody(_product),
    );
  }
}

