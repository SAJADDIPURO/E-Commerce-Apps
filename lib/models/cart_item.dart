import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product.dart';

class CartItem {
  final Product product;
  int quantity;
  final String size;
  final Color color;

  CartItem({
    required this.product,
    required this.quantity,
    required this.size,
    required this.color,
  });
}
