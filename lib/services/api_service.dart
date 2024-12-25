import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/shop.dart';

class ApiService {
  final String baseUrl =
      'http://192.168.234.231:8000'; // Replace with your backend URL

  Future<List<Shop>> fetchShops() async {
    final response = await http.get(Uri.parse('$baseUrl/shops'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Shop> shops =
          (data['shops'] as List).map((shop) => Shop.fromJson(shop)).toList();
      return shops;
    } else {
      throw Exception('Failed to load shops');
    }
  }
}
