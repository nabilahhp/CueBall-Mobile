// models/cart_item.dart
class CartItem {
  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}