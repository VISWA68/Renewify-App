import 'package:flutter/material.dart';
import '../models/shop.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ShopDetailsPage extends StatelessWidget {
  final Shop shop;

  ShopDetailsPage({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(shop.shopName)),
      body: ListView.builder(
        itemCount: shop.products.length,
        itemBuilder: (context, index) {
          final product = shop.products[index];
          return ListTile(
            leading: Image.network(product.image, width: 50),
            title: Text(product.name),
            subtitle: Text('₹${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(product);
              },
            ),
          );
        },
      ),
    );
  }
}
