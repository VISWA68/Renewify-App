import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cart.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cart[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50),
                  title: Text(product.name),
                  subtitle: Text('₹${product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Total: ₹${cartProvider.totalPrice}',
                    style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: () {
                    // Implement UPI payment
                  },
                  child: Text('Pay Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
