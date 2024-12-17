import 'Product.dart';

//Mặt hàng trong giỏ
//
class Item {
  Product product;
  int quantity;

  Item({required this.product, this.quantity = 1});
}
