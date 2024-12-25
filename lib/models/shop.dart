import 'product.dart';

class Shop {
  final String id;
  final String shopName;
  final String address;
  final String upiId;
  final String sellerId;
  final String shopImage;
  final List<Product> products;

  Shop({
    required this.id,
    required this.shopName,
    required this.address,
    required this.upiId,
    required this.sellerId,
    required this.shopImage,
    required this.products,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    List<Product> products = (json['products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();

    return Shop(
      id: json['_id'],
      shopName: json['shop_name'],
      address: json['address'],
      upiId: json['upi_id'],
      sellerId: json['seller_id'],
      shopImage: json['shop_image'],
      products: products,
    );
  }
}
