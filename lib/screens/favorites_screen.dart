import 'package:coffenoo/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Favorites', style: TextStyle(color: AppColors.textPrime)),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text(
          'Your favorites will appear here.',
          style: TextStyle(color: AppColors.textPrime, fontSize: 18),
        ),
      ),
    );
  }
}

