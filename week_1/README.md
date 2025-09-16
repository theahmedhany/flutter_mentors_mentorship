# Smart Ahwa Manager 🍵☕

A modern Flutter application for managing coffee shop orders, built with clean architecture and SOLID principles. This app demonstrates professional Flutter development practices, state management, and user interface design.

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>
  
  <br/>
  
  <img src="https://img.shields.io/github/license/username/repo?style=flat-square&color=brown" alt="License"/>
  <img src="https://img.shields.io/github/stars/username/repo?style=flat-square&color=brown" alt="Stars"/>
  <img src="https://img.shields.io/github/forks/username/repo?style=flat-square&color=brown" alt="Forks"/>
  <img src="https://img.shields.io/github/issues/username/repo?style=flat-square&color=brown" alt="Issues"/>
</div>

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

## 📊 App Screens

### 1. Add Order Tab

- Customer name input with validation
- Drink selection dropdown with visual indicators
- Special instructions field
- Professional form design with clear CTAs

<div align="left">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/7e562dbc-fd94-4fde-98e3-43c9b7ef140e" alt="Add Order Tab Empty" width="200"/></td>
      <td><img src="https://github.com/user-attachments/assets/82e084ce-bac3-4319-bede-9c0fb2d7454d" alt="Add Order Tab Error" width="200"/></td>
      <td><img src="https://github.com/user-attachments/assets/6e984edc-ca9a-46a8-9b0e-ad8da9d61d71" alt="Add Order Tab Filled" width="200"/></td>
    </tr>
  </table>
</div>

### 2. Pending Orders Tab

- Real-time order list with order details
- Order completion functionality
- Empty state with encouraging messaging
- Card-based layout for easy scanning

<div align="left">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/caa97f4e-67a4-4920-82e5-ac286bf3314b" alt="Pending Orders Tab Empty" width="200"/></td>
      <td><img src="https://github.com/user-attachments/assets/88b82f39-f46c-4daa-9df1-29d3ceccd158" alt="Pending Orders Tab In Progress" width="200"/></td>
      <td><img src="https://github.com/user-attachments/assets/b07cba01-e721-4d1f-a07a-b0c21559e26a" alt="Pending Orders Tab Completed" width="200"/></td>
    </tr>
  </table>
</div>

### 3. Reports Tab

- Daily summary with key metrics
- Top-selling drinks analytics
- Revenue tracking
- Visual data presentation with charts and indicators

<div align="left">
  <table>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/8e0f4d36-4964-446c-a5d9-962945e83add" alt="Product Added Successfully" width="200"/></td>
      <td><img src="https://github.com/user-attachments/assets/f8c7e3c1-1fe8-4b54-87d7-30476cf44dc4" alt="Reports Tab Daily Summary" width="200"/></td>
      <td><img src="https://github.com/user-attachments/assets/e9979718-b376-4574-96c0-dd0360df5e87" alt="Reports Tab Top Selling" width="200"/></td>
    </tr>
  </table>
</div>

---

<h3 align="left">
    Contact with me
</h3>

<div align="left">
  <a href="mailto:a7medhanyshokry@gmail.com" target="_blank">
    <img src="https://skillicons.dev/icons?i=gmail&theme=light" width="52" height="40" alt="gmail logo"/>
  </a>
  <a href="https://www.linkedin.com/in/theahmedhany/" target="_blank">
    <img src="https://skillicons.dev/icons?i=linkedin&theme=dark" width="52" height="40" alt="linkedin logo"/>
  </a>
  <a href="https://x.com/theahmedhany" target="_blank">
    <img src="https://skillicons.dev/icons?i=twitter&theme=dark" width="52" height="40" alt="twitter logo"/>
  </a>
</div>

---
