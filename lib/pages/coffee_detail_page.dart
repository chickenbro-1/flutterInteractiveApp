import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class ProductPage extends StatefulWidget {
  final Coffee coffee;

  const ProductPage({Key? key, required this.coffee}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  String selectedSize = 'M';
  String selectedTopping = 'None';
  String selectedMilk = 'None';

  void addToCart(Coffee coffee) {
    coffee.quantity = quantity;
    coffee.size = selectedSize;
    coffee.toppings = selectedTopping;
    coffee.milk = selectedMilk;
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    Navigator.pop(context);
  }

  void showBottomSheetSelector(
      List<String> items, String currentValue, Function(String) onSelected) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items.map((item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  onSelected(item);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              child: Image.asset(widget.coffee.imagePath),
            ),
            SizedBox(height: 20),
            Text(
              widget.coffee.name,
              style: TextStyle(
                fontSize: 21,
                fontFamily: 'Georgia',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'QUANTITY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text(
                  '$quantity',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF00754A),
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'SIZE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['S', 'M', 'L'].map((size) {
                final isSelected = selectedSize == size;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(size),
                    selected: isSelected,
                    selectedColor: Color(0xFF00754A),
                    backgroundColor: Colors.white,
                    onSelected: (selected) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                    checkmarkColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: isSelected ? Colors.transparent : Colors.grey,
                        width: isSelected ? 0 : 2.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Toppings selection
            Text(
              'TOPPINGS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildSelectionTile(
              title: 'Toppings',
              value: selectedTopping,
              onTap: () {
                showBottomSheetSelector(
                    ['Chocolate', 'Caramel', 'Vanilla', 'Hazelnut', 'Honey'],
                    selectedTopping, (value) {
                  setState(() {
                    selectedTopping = value;
                  });
                });
              },
            ),
            SizedBox(height: 20),
            // Milk selection
            Text(
              'MILK',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildSelectionTile(
              title: 'Milk',
              value: selectedMilk,
              onTap: () {
                showBottomSheetSelector(
                    ['Milk Foam', 'Skim', 'Soy', 'Almond'], selectedMilk,
                    (value) {
                  setState(() {
                    selectedMilk = value;
                  });
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                addToCart(widget.coffee);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00754A),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionTile({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    final bool isSelected = (value != "None" && title == 'Toppings') ||
        (value != "None" && title == 'Milk');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF00754A) : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Color(0xFF00754A) : Colors.grey,
              ),
            ),
            ImageIcon(
              AssetImage("lib/images/pulldown.png"),
              color: isSelected ? Color(0xFF00754A) : Colors.grey,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
