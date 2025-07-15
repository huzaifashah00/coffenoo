import 'package:coffenoo/screens/home_screen.dart';
import 'package:coffenoo/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }, 
      child: Text('Continue'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrime,
        fixedSize: const Size(100,40),
      ),);
  }
}
