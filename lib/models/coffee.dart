class Coffee {
  final String name;
  final String price;
  final String imagePath;
  String size;
  String toppings;
  String milk;
  int quantity;

  Coffee({
    required this.name,
    required this.price,
    required this.imagePath,
    this.size = "M",
    this.toppings = "None",
    this.milk = "None",
    this.quantity = 0
  });
}
