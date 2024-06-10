// models/cart_item.dart
class CartItem {
  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  int quantity;
  final String idUser;

  CartItem({
    required this.id,
    required this.idUser,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      idUser: json['idUser'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }
}
