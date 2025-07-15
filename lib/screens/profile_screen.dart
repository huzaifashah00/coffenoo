import 'package:coffenoo/utils/constants/colors.dart';
import 'package:coffenoo/utils/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                    Icons.arrow_back,
                    color: AppColors.textPrime,
                    size: 28,
                  ),
                  Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrime,
                    ),
                  ),
                  Icon(
                    Icons.edit,
                    color: AppColors.textPrime,
                    size: 28,
                  ),
                ],
              ),
              SizedBox(height: 30),
              
              // Profile Picture and Info
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.textPrime,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'John Doe',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrime,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Coffee Lover ☕',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              
              // Menu Items
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem(
                      icon: Icons.shopping_bag_outlined,
                      title: 'My Orders',
                      subtitle: 'View your order history',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.favorite_border,
                      title: 'Favorites',
                      subtitle: 'Your favorite coffee drinks',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.location_on_outlined,
                      title: 'Addresses',
                      subtitle: 'Manage delivery addresses',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.payment_outlined,
                      title: 'Payment Methods',
                      subtitle: 'Manage your payment options',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_outlined,
                      title: 'Notifications',
                      subtitle: 'Manage your notifications',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      subtitle: 'Get help with your account',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      subtitle: 'App preferences and settings',
                      onTap: () {},
                    ),
                    SizedBox(height: 20),
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      subtitle: 'Sign out of your account',
                      onTap: () {},
                      isLogout: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isLogout ? Colors.red.withOpacity(0.1) : AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isLogout ? Colors.red : AppColors.primary,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isLogout ? Colors.red : AppColors.textPrime,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[400],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 16,
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        tileColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
