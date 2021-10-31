import 'package:shop_app_example/base/base_event.dart';
import 'package:shop_app_example/models/cart_item.dart';

class AddCartItemEvent extends BaseEvent{
  int productId;

  AddCartItemEvent(this.productId);
}