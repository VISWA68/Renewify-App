import 'cart_page.dart';
import 'package:flutter/material.dart';
import '../models/shop.dart';
import '../services/api_service.dart';
import 'shop_details_page.dart';

class ShopsPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shops'),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            icon: const Icon(Icons.shopping_bag)),
      ),
      body: FutureBuilder<List<Shop>>(
        future: apiService.fetchShops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No shops available'));
          }

          final shops = snapshot.data!;
          return ListView.builder(
            itemCount: shops.length,
            itemBuilder: (context, index) {
              final shop = shops[index];
              return ListTile(
                leading: Image.network(shop.shopImage, width: 50, height: 50),
                title: Text(shop.shopName),
                subtitle: Text(shop.address),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetailsPage(shop: shop),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
