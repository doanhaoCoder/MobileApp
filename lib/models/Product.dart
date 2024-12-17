class Product {
  final String? image, image_url, title, description, category, name;
  final double price;

  final size, id;

  Product(
      {required this.image,
      this.title = "",
      this.image_url = "",
      this.name = "",
      this.category = "",
      this.price = 0,
      required this.description,
      required this.size,
      this.id = 0});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      size: 0,
      price: json['price'].toDouble(),
      image: json['image'],
      image_url: json['image_url'],
    );
  }
}

String dummyText = "Đây là sản phẩm tuyệt vời. Không thể tin được";
