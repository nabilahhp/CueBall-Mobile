// provider/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';  // Import model CartItem

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  void addToCart(CartItem product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _cart[index].quantity++;
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void incrementQty(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  void decrementQty(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    }
    notifyListeners();
  }

  double totalPrice() {
    double total = 0.0;
    for (var item in _cart) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void removeItem(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
