import 'package:coffenoo/utils/constants/colors.dart';
import 'package:coffenoo/utils/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Latte',
      'description': 'Best Coffee',
      'price': 30,
      'image': 'assets/images/coffee_cup.png',
      'quantity': 2
    },
    {
      'name': 'Espresso',
      'description': 'Best Coffee',
      'price': 30,
      'image': 'assets/images/coffee_cup_2.png',
      'quantity': 1
    },
  ];

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: AppColors.textPrime)),
        backgroundColor: AppColors.primary,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(color: AppColors.textPrime, fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemCard(
                        name: item['name'],
                        description: item['description'],
                        price: item['price'],
                        image: item['image'],
                        quantity: item['quantity'],
                        onQuantityChanged: (quantity) {
                          setState(() {
                            if (quantity > 0) {
                              cartItems[index]['quantity'] = quantity;
                            } else {
                              cartItems.removeAt(index);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                // Total and Checkout
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrime,
                            ),
                          ),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle checkout
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Order placed successfully!'),
                                backgroundColor: AppColors.primary,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              color: AppColors.textPrime,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;
  final int quantity;
  final Function(int) onQuantityChanged;

  const CartItemCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Coffee Image
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          
          // Coffee Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrime,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${price}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          
          // Quantity Controls
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () => onQuantityChanged(quantity + 1),
                  icon: Icon(Icons.add, color: Colors.white, size: 16),
                  padding: EdgeInsets.zero,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '$quantity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrime,
                  ),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () => onQuantityChanged(quantity - 1),
                  icon: Icon(Icons.remove, color: Colors.white, size: 16),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
