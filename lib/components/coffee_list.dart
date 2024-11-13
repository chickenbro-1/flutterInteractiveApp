import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final Widget icon;
  final bool isCart;

  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
    required this.isCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(
          coffee.name,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isCart
                  ? "${coffee.price} \$${coffee.quantity > 0 ? '  x ${coffee.quantity}' : ''}"
                  : "${coffee.price} \$",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            if (isCart) ...[
              Text(
                "${coffee.size}, ${coffee.toppings}, ${coffee.milk}",
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
            ],
          ],
        ),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
