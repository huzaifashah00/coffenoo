import 'package:flutter/material.dart';

class Dimensions {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  // Example usage: Dimensions.heightRatio(0.02) gives 2% of screen height
  static double heightRatio(double value) => screenHeight * value;
  static double widthRatio(double value) => screenWidth * value;

  // Example fixed spacing values (optional)
  static double paddingSmall = 10;
  static double paddingMedium = 16;
  static double paddingLarge = 24;
}
