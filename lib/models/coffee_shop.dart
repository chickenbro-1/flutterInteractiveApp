import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Americano',
      price: '9.99',
      imagePath: 'lib/images/americano.png',
      size: 'M',
      toppings: 'None',
      milk: 'None',
      quantity: 0,
    ),

    // latte
    Coffee(
      name: 'Affogato',
      price: '6.99',
      imagePath: 'lib/images/affogato.png',
      size: 'M',
      toppings: 'None',
      milk: 'None',
      quantity: 0,
    ),

    // espresso
    Coffee(
      name: 'Espresso',
      price: '5.99',
      imagePath: 'lib/images/expresso.png',
      size: 'M',
      toppings: 'None',
      milk: 'None',
      quantity: 0,
    ),

    // iced coffee
    Coffee(
      name: 'Iced Coffee',
      price: '2.99',
      imagePath: 'lib/images/iced.png',
      size: 'M',
      toppings: 'None',
      milk: 'None',
      quantity: 0,
    ),

    // frappe
    Coffee(
      name: 'Cappuccino',
      price: '4.99',
      imagePath: 'lib/images/cappuccino.png',
      size: 'M',
      toppings: 'None',
      milk: 'None',
      quantity: 0,
    ),
    Coffee(
      name: 'Macchiato',
      price: '5.99',
      imagePath: 'lib/images/macchiato.png',
      size: 'M',
      toppings: 'None',
      milk: 'None',
      quantity: 0,
    ),
  ];

  // user cart
  final List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
