class CartModel {
  final String name;
  final String img;
  final double price;
  int quantity;

  CartModel({
    required this.name,
    required this.img,
    required this.price,
    this.quantity = 1,
  });
}