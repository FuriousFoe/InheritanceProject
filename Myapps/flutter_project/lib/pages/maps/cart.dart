import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = _cartItems[index];
                  return ListTile(
                    leading: Image.network(cartItem.product.image),
                    title: Text(cartItem.product.name),
                    subtitle: Text("\$${cartItem.product.price}"),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        _removeFromCart(cartItem);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement checkout functionality
              },
              child: Text("Checkout"),
            ),
          ],
        ),
      ),
    );
  }

  // Mock data for cart items
  List<CartItem> _cartItems = [
    CartItem(
      product: Product(
        name: "Hostel Room",
        price: 50,
        image: "https://example.com/hostel-room.jpg",
      ),
    ),
    // Add more items here...
  ];

  void _removeFromCart(CartItem cartItem) {
    setState(() {
      _cartItems.remove(cartItem);
    });
  }
}

class CartItem {
  final Product product;

  CartItem({required this.product});
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}
