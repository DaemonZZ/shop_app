import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_example/bloc/cart_bloc.dart';
import 'package:shop_app_example/constants.dart';
import 'package:shop_app_example/datasource/network/api.dart';
import 'package:shop_app_example/models/product.dart';
import 'package:shop_app_example/models/user.dart';
import 'package:shop_app_example/screen/detail/detail_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    ApiRequest.fetchProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Consumer<User?>(
            builder: (ctx,user,child){
              return Text(
                "Welcome ${user?.name}",
                style: Theme.of(context).textTheme.headline3,
              );
            },
          ),
        ),
        const Categories(),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding
                  ),
                  itemBuilder: (context, index) {
                    return ItemCard(
                      product: products[index],///////
                      press: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return Provider<CartBloc>.value(value: CartBloc(), child: Detail(products[index]));
                          }
                        ));
                      },
                    );
                  }),
            ))
      ],
    );
  }
}

