import 'package:coffenoo/screens/cart_screen.dart';
import 'package:coffenoo/screens/coffee_detail_screen.dart';
import 'package:coffenoo/screens/favorites_screen.dart';
import 'package:coffenoo/screens/profile_screen.dart';
import 'package:coffenoo/utils/constants/colors.dart';
import 'package:coffenoo/utils/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  final List<String> categories = ['Hot Coffee', 'Cold Coffee', 'Cappuccino'];
  
  final List<Map<String, dynamic>> coffeeItems = [
    {
      'name': 'Latte',
      'description': 'Best Coffee',
      'price': 30,
      'image': 'assets/images/coffee_cup.png',
      'category': 'Hot Coffee'
    },
    {
      'name': 'Espresso',
      'description': 'Best Coffee',
      'price': 30,
      'image': 'assets/images/coffee_cup_2.png',
      'category': 'Hot Coffee'
    },
    {
      'name': 'Black Coffee',
      'description': 'Best Coffee',
      'price': 30,
      'image': 'assets/images/coffee_cup_3.png',
      'category': 'Hot Coffee'
    },
    {
      'name': 'Cold Coffee',
      'description': 'Best Coffee',
      'price': 30,
      'image': 'assets/images/coffee_cup.png',
      'category': 'Cold Coffee'
    },
  ];

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: AppColors.textPrime,
                    size: 28,
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    color: AppColors.textPrime,
                    size: 28,
                  ),
                ],
              ),
              SizedBox(height: 30),
              
              // Title
              Text(
                "It's a Great Day for Coffee",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrime,
                ),
              ),
              SizedBox(height: 20),
              
              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Find your coffee',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              
              // Category Tabs
              Row(
                children: categories.asMap().entries.map((entry) {
                  int index = entry.key;
                  String category = entry.value;
                  bool isSelected = selectedCategory == index;
                  
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategory = index),
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected ? AppColors.primary : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? AppColors.primary : Colors.grey[400],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              
              // Coffee Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: coffeeItems.length,
                  itemBuilder: (context, index) {
                    final coffee = coffeeItems[index];
                    return CoffeeCard(
                      name: coffee['name'],
                      description: coffee['description'],
                      price: coffee['price'],
                      image: coffee['image'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(color: Colors.grey[800]!, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, true, () {}),
            _buildNavItem(Icons.favorite_border, false, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen()));
            }),
            _buildNavItem(Icons.shopping_bag_outlined, false, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            }),
            _buildNavItem(Icons.person_outline, false, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            }),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Icon(
          icon,
          color: isSelected ? AppColors.primary : Colors.grey[400],
          size: 28,
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;
  
  const CoffeeCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeDetailScreen(
              name: name,
              description: description,
              price: price.toDouble(),
              image: image,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Coffee Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          // Coffee Details
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                    ],
                  ),
                  
                  // Price and Add Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' 24${price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrime,
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
