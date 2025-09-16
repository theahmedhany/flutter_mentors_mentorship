# Smart Ahwa Manager 🍵☕

A modern Flutter application for managing coffee shop orders, built with clean architecture and SOLID principles. This app demonstrates professional Flutter development practices, state management, and user interface design.

## 📱 Features

### Core Functionality

- **Order Management**: Add, track, and complete customer orders
- **Multi-Drink Support**: Shai (Egyptian Tea), Turkish Coffee, and Hibiscus Tea
- **Real-time Updates**: Dynamic order status tracking
- **Sales Analytics**: Comprehensive reporting and revenue tracking
- **Professional UI**: Clean, intuitive interface with Material Design

### Technical Features

- **Clean Architecture**: Organized code structure with separation of concerns
- **SOLID Principles**: Demonstrates all five SOLID principles in practice
- **Modular Design**: Reusable widgets and components
- **State Management**: Efficient state handling with StatefulWidget
- **Custom Styling**: Consistent theme and professional appearance

## 🏗️ Architecture

The app follows a clean, modular architecture:

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models and business logic
│   ├── drink.dart           # Abstract drink class and implementations
│   ├── order.dart           # Order model with encapsulation
│   └── order_manager.dart   # Business logic for order operations
├── screens/                  # Screen-level widgets
│   └── ahwa_manager_screen.dart
├── widgets/                  # Reusable UI components
│   ├── custom_tab_bar.dart  # Custom tab navigation
│   ├── add_order_tab.dart   # Order creation interface
│   ├── pending_orders_tab.dart # Order tracking interface
│   └── reports_tab.dart     # Analytics dashboard
└── utils/                   # Utility classes
    └── drink_factory.dart   # Factory pattern for drink creation
```

## 🛠️ SOLID Principles Implementation

### 1. Single Responsibility Principle (SRP)

- **OrderManager**: Handles only order-related operations
- **DrinkFactory**: Responsible only for creating drink instances
- **Each Widget**: Has a single, well-defined purpose

### 2. Open/Closed Principle (OCP)

- **DrinkFactory**: Can be extended with new drink types without modification
- **Drink Classes**: New drink types can be added without changing existing code

### 3. Liskov Substitution Principle (LSP)

- **Drink Hierarchy**: All drink implementations can substitute the abstract Drink class
- **Polymorphic Behavior**: Consistent interface across all drink types

### 4. Interface Segregation Principle (ISP)

- **Focused Interfaces**: Each class exposes only necessary methods
- **Widget Contracts**: Clear, minimal interfaces between components

### 5. Dependency Inversion Principle (DIP)

- **Abstract Dependencies**: High-level modules depend on abstractions
- **Factory Pattern**: Decouples object creation from usage

## 🎨 UI/UX Features

### Design Elements

- **Material Design 3**: Modern, accessible interface
- **Custom Color Scheme**: Brown/coffee theme for brand consistency
- **Responsive Layout**: Works on various screen sizes
- **Visual Feedback**: Snackbars, animations, and state indicators

### User Experience

- **Intuitive Navigation**: Tab-based interface for easy access
- **Form Validation**: Input validation with user-friendly error messages
- **Real-time Updates**: Immediate feedback on user actions
- **Professional Polish**: Attention to detail in spacing, typography, and interactions

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd week_1
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android APK
flutter build apk --release

# iOS (requires macOS and Xcode)
flutter build ios --release

# Web
flutter build web
```

## 📊 App Screens

### 1. Add Order Tab

- Customer name input with validation
- Drink selection dropdown with visual indicators
- Special instructions field
- Professional form design with clear CTAs

### 2. Pending Orders Tab

- Real-time order list with order details
- Order completion functionality
- Empty state with encouraging messaging
- Card-based layout for easy scanning

### 3. Reports Tab

- Daily summary with key metrics
- Top-selling drinks analytics
- Revenue tracking
- Visual data presentation with charts and indicators

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run with coverage
flutter test --coverage
```

## 📱 Screenshots

_Note: Add actual app screenshots here once the app is running_

### Main Dashboard

![Dashboard](screenshots/dashboard.png)

### Order Management

![Orders](screenshots/orders.png)

### Analytics

![Analytics](screenshots/analytics.png)

## 🔧 Configuration

### Environment Setup

- Minimum SDK: Android 21 (Android 5.0)
- Target SDK: Latest Android version
- iOS Deployment Target: 12.0

### Assets

The app includes custom SVG assets for:

- App logo and branding
- Drink type icons (Shai, Turkish Coffee, Hibiscus Tea)
- UI enhancement graphics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style

- Follow Flutter/Dart conventions
- Use meaningful variable and function names
- Comment complex logic
- Maintain consistent formatting

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Flutter Mentors Mentorship Program** - Week 1 Project
- Built with ❤️ using Flutter

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design team for the design system
- Coffee shop owners for inspiration 🍵

## 📞 Support

If you have any questions or need support:

- Create an issue in the repository
- Check the [Flutter documentation](https://flutter.dev/docs)
- Join the [Flutter community](https://flutter.dev/community)

---

**Happy Coding! ☕🚀**

> "Good code is like a well-brewed coffee - it takes time, attention to detail, and the right ingredients to make it perfect."
