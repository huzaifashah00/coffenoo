# ☕ Coffenoo - Coffee Shop Mobile App

A beautiful and intuitive coffee shop mobile application built with Flutter, featuring a modern dark theme design and smooth user experience.

## 📱 Screenshots

<div align="center">
  <img src="screenshorts/Detail Screen.jpg" width="200" alt="Detail Screen">
  <img src="screenshots/home.png" width="200" alt="Home Screen">
  <img src="screenshots/coffee_detail.png" width="200" alt="Coffee Detail">
  <img src="screenshots/cart.png" width="200" alt="Cart Screen">
</div>

## ✨ Features

### 🎯 Core Features
- **Beautiful Onboarding**: Interactive slider with stunning coffee imagery
- **Home Screen**: Browse coffee categories with intuitive navigation
- **Coffee Detail View**: Detailed product information with quantity selection
- **Shopping Cart**: Add, remove, and manage coffee orders
- **Favorites**: Save your favorite coffee drinks
- **User Profile**: Manage account settings and preferences

### 🎨 Design Highlights
- **Dark Theme**: Modern coffee-themed color palette
- **Responsive Design**: Optimized for all screen sizes
- **Smooth Animations**: Fluid transitions and interactions
- **Google Fonts**: Beautiful typography using Poppins font
- **Coffee-Centric UI**: Warm browns and cream colors

### 📱 Screens
1. **Onboarding Slider** - Welcome experience with 3 slides
2. **Home Screen** - Coffee categories and product grid
3. **Coffee Detail** - Product information and ordering
4. **Cart Screen** - Order management and checkout
5. **Favorites** - Saved coffee preferences
6. **Profile** - User account management

## 🛠️ Technical Stack

- **Framework**: Flutter 3.6.2
- **Language**: Dart
- **Fonts**: Google Fonts (Poppins)
- **State Management**: StatefulWidget
- **Navigation**: Flutter Navigation 2.0
- **Platform**: Android & iOS

## 📁 Project Structure

```
lib/
├── screens/
│   ├── sliders_screen.dart      # Onboarding slider
│   ├── home_screen.dart         # Main coffee browsing
│   ├── coffee_detail_screen.dart # Product details
│   ├── cart_screen.dart         # Shopping cart
│   ├── favorites_screen.dart    # Favorite items
│   └── profile_screen.dart      # User profile
├── utils/
│   └── constants/
│       ├── colors.dart          # App color scheme
│       ├── dimensions.dart      # Responsive dimensions
│       ├── assets.dart          # Asset paths
│       ├── strings.dart         # Text constants
│       └── button.dart          # Custom button widget
└── main.dart                    # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.6.2)
- Dart SDK
- Android Studio / VS Code
- Android/iOS Emulator or Physical Device

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/coffenoo.git
cd coffenoo
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

## 🎨 Color Scheme

| Color | Hex Code | Usage |
|-------|----------|-------|
| Primary | #6F4E37 | Coffee Brown - Main accent |
| Secondary | #DAB49D | Light Coffee - Secondary elements |
| Background | #333333 | Dark Gray - App background |
| Text Prime | #F5F5F5 | Light Gray - Primary text |
| Text Light | #777777 | Medium Gray - Secondary text |
| Accent | #B08968 | Brown Accent - Highlights |

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

## 🔧 Development

### Adding New Coffee Items
1. Add coffee images to `assets/images/`
2. Update `coffeeItems` list in `home_screen.dart`
3. Reference new images in `assets.dart`

### Customizing Colors
1. Edit color constants in `utils/constants/colors.dart`
2. Colors automatically apply throughout the app

### Adding New Screens
1. Create new screen file in `screens/`
2. Import and navigate from existing screens
3. Update navigation in `home_screen.dart`

## 🎯 Future Enhancements

- [ ] User Authentication
- [ ] Online Payment Integration
- [ ] Order Tracking
- [ ] Push Notifications
- [ ] Coffee Customization
- [ ] Store Locator
- [ ] Reviews & Ratings
- [ ] Loyalty Program

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Development Tool**: Built with the assistance of [Warp AI](https://warp.dev) - completed in just 7 minutes! 🚀
- **Design Inspiration**: Modern coffee shop aesthetics
- **Flutter Community**: For excellent documentation and resources
- **Google Fonts**: For beautiful typography

## 📧 Contact

For questions or suggestions, please open an issue or contact:
- **Email**: your.email@example.com
- **GitHub**: [@yourusername](https://github.com/yourusername)

---

<div align="center">
  <p>Made with ❤️ and ☕ using Flutter</p>
  <p><strong>⚡ Developed with Warp AI assistance in 7 minutes!</strong></p>
</div>
