import 'package:coffenoo/utils/constants/assets.dart';
import 'package:coffenoo/utils/constants/button.dart';
import 'package:coffenoo/utils/constants/colors.dart';
import 'package:coffenoo/utils/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FullScreenSlider extends StatefulWidget {
  const FullScreenSlider({super.key});

  @override
  State<FullScreenSlider> createState() => _FullScreenSliderState();
}

class _FullScreenSliderState extends State<FullScreenSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': AppAssets.slider1,
      'title': 'Freshly Brewed',
      'subtitle': 'Experience the aroma of premium beans.'
    },
    {
      'image': AppAssets.slider2,
      'title': 'Chill & Relax',
      'subtitle': 'Take a break with our smooth coffee.'
    },
    {
      'image': AppAssets.slider3,
      'title': 'Coffee Delivered',
      'subtitle': 'Order your favorite blends from your phone.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context); // responsive init

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _slides.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return Scaffold(
                backgroundColor: AppColors.background,
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.screenHeight/7,horizontal: Dimensions.screenWidth/4),
                      child: 
                        Text('Coffenoo...',
                          style: GoogleFonts.nothingYouCouldDo(color: AppColors.textPrime, fontSize: 40),)),
                    Image.asset(
                      _slides[index]['image']!,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4), // overlay
                    ),
                    Positioned(
                      bottom: Dimensions.heightRatio(0.2),
                      left: 24,
                      right: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _slides[index]['title']!,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _slides[index]['subtitle']!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth/4.0),
              child: Button(),
            )),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentPage == index ? 24 : 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primary
                        : Colors.white60,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
