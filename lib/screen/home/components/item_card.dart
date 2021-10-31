import 'package:flutter/material.dart';
import 'package:shop_app_example/models/product.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.product, required this.press})
      : super(key: key);

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                    color: Color(product.colorCode),
                    borderRadius: BorderRadius.circular(16)),
                child: Image.network(product.imgUrl)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/4),
            child: Text(product.title),
          ),
          Text(
            "\$${product.price.toString()}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
