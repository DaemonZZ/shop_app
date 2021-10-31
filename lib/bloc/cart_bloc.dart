import 'dart:async';

import 'package:shop_app_example/base/base_bloc.dart';
import 'package:shop_app_example/base/base_event.dart';
import 'package:shop_app_example/event/cart_event/add_cart_item_event.dart';
import 'package:shop_app_example/event/cart_event/delete_cart_item_event.dart';
import 'package:shop_app_example/models/cart.dart';
import 'package:shop_app_example/models/cart_item.dart';

class CartBloc extends BaseBloc{
  StreamController<Cart> _cartStreamController = StreamController();

  @override
  dispatchEvent(BaseEvent event) {
    if(event is AddCartItemEvent){

      print(event.productId);

    } else if ( event is DeleteCartItemEvent){

    }
  }

  @override
  dispose() {
    super.dispose();
    _cartStreamController.close();
  }

  _addItem(Item item){

  }

  _removeItem(Item item){

  }

  _clearCart(){}
}