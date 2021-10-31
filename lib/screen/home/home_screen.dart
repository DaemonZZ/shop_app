import 'dart:io';

import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const IconTheme(
            data: IconThemeData(color: Colors.black54),
            child: Icon(Icons.close)),
        onPressed: () {
          exit(0);
        },
      ),
      title: Text(
        "Shop App demo",
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
            onPressed: () {},
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
      body: const Body()
    );
  }
}
