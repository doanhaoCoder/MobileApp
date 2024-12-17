import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'package:Shop_KT/ProductDetailsAPI.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowproductAPI extends StatefulWidget {
  @override
  ShowproductAPIState createState() => ShowproductAPIState();
}

class ShowproductAPIState extends State<ShowproductAPI> {
  late Future<List<Product>> lstproducts;

  @override
  void initState() {
    super.initState();
    lstproducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://6732a3df2a1b1a4ae1107e80.mockapi.io/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Không đọc được sản phẩm từ backend');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sản phẩm',
          style: TextStyle(
            color: Color(0xff1b1b1b),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context); // Quay lại
        //   },
        // ),
      ),
      body: FutureBuilder<List<Product>>(
        future: lstproducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu'));
          } else {
            List<Product> lst = snapshot.data!;
            return GridView.builder(
              itemCount: lst.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsAPI(
                                product: lst[index],
                              ),
                            ),
                          ),
                          child: Image.network(
                            lst[index].image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lst[index].title.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "\$${lst[index].price.toString()}",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
