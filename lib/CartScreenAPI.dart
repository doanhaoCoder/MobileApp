import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'models/Item.dart';
import 'models/Cart.dart';

class CartScreenAPI extends StatefulWidget {
  @override
  _CartScreenAPIState createState() => _CartScreenAPIState();
}

class _CartScreenAPIState extends State<CartScreenAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Giỏ của bạn',
          style: TextStyle(
            color: Color(0xff1b1b1b),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context); // Quay lại trang trước
        //   },
        // ),
      ),
      body: Cart.cartItems.isEmpty
          ? Center(
              child: Text('Giỏ hàng của bạn trống'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.cartItems.length,
                    itemBuilder: (context, index) {
                      Item item = Cart.cartItems[index];
                      Product product = item.product;

                      return ListTile(
                        leading: Image.network(
                          product.image ?? 'assets/default_image.png',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(product.title ?? 'No Title'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\$${product.price}"),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      } else {
                                        Cart.removeFromCart(product.id);
                                      }
                                    });
                                  },
                                ),
                                Text('${item.quantity}'), // Hiển thị số lượng
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              Cart.removeFromCart(product.id);
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('${product.title} Đã Xóa Khỏi Giỏ'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${Cart.getTotalPrice().toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Xử lý khi nhấn nút thanh toán
                          print("Thanh Toán Thành Công");
                        },
                        child: Text('Thanh toán'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
