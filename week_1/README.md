# Smart Ahwa Manager

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

<p align="center">
  <strong>A sophisticated Flutter application for modern coffee shop management</strong>
  <br/>
  Built with clean architecture, SOLID principles, and exceptional user experience
</p>

---

## Overview

Smart Ahwa Manager is a production-ready Flutter application that revolutionizes coffee shop operations through intuitive order management, real-time analytics, and professional-grade architecture. Designed for scalability and maintainability, it showcases enterprise-level Flutter development practices.

### Key Highlights

- **Clean Architecture** - Scalable, maintainable codebase following industry best practices
- **Real-time Operations** - Instant order tracking and status updates
- **Smart Analytics** - Comprehensive sales reporting and business insights
- **Modern UI/UX** - Material Design 3 with custom theming
- **SOLID Principles** - Demonstrates all five SOLID principles in practice

---

## Features

<table>
  <tr>
    <td width="50%">
      
### Order Management
- Streamlined order creation and tracking
- Multi-drink support (Shai, Turkish Coffee, Hibiscus Tea)
- Real-time order status updates
- Customer information management
- Special instructions handling

    </td>
    <td width="50%">


### Business Intelligence

- Daily sales analytics
- Top-selling products insights
- Revenue tracking and reporting
- Order completion metrics
- Performance dashboards

    </td>
  </tr>
  <tr>
    <td width="50%">


### User Experience

- Intuitive tab-based navigation
- Responsive design for all screen sizes
- Real-time notifications and feedback
- Smooth animations and transitions
- Professional coffee-themed styling

    </td>
    <td width="50%">


### Technical Excellence

- Modular component architecture
- Reusable widget library
- Efficient state management
- Comprehensive error handling
- Extensive code documentation

      </td>

    </tr>
  </table>

---

## Architecture & Design Patterns

### Project Structure

```
lib/
├── main.dart                     # Application entry point
├── models/                       # Business logic & data models
│   ├── drink.dart               # Abstract drink class hierarchy
│   ├── order.dart               # Order entity with encapsulation
│   └── order_manager.dart       # Core business operations
├── screens/                     # Application screens
│   └── ahwa_manager_screen.dart # Main application interface
├── widgets/                     # Reusable UI components
│   ├── custom_tab_bar.dart      # Custom navigation component
│   ├── add_order_tab.dart       # Order creation interface
│   ├── pending_orders_tab.dart  # Order tracking dashboard
│   └── reports_tab.dart         # Analytics & reporting view
└── utils/                       # Utility classes & helpers
    └── drink_factory.dart       # Factory pattern implementation
```

### SOLID Principles Implementation

<details>
<summary><b>Single Responsibility Principle (SRP)</b></summary>

Each class has a single, well-defined responsibility:

- `OrderManager` handles order operations only
- `DrinkFactory` manages drink instance creation only
- `Widgets` focus on specific UI concerns only

</details>

<details>
<summary><b>Open/Closed Principle (OCP)</b></summary>

System is open for extension, closed for modification:

- New drink types can be added without changing existing code
- Factory pattern enables easy extensibility

</details>

<details>
<summary><b>Liskov Substitution Principle (LSP)</b></summary>

Derived classes are substitutable for base classes:

- All drink implementations can replace abstract `Drink` class
- Polymorphic behavior ensures consistency

</details>

<details>
<summary><b>Interface Segregation Principle (ISP)</b></summary>

Focused, minimal interfaces:

- Classes expose only necessary methods
- Clean contracts between components

</details>

<details>
<summary><b>Dependency Inversion Principle (DIP)</b></summary>

High-level modules depend on abstractions:

- Factory pattern decouples object creation
- Abstract dependencies promote flexibility

</details>

---

## Application Showcase

### User Interface Highlights

<div align="center">

|                                                      **Add Orders**                                                      |                                                       **Track Orders**                                                        |                                                   **View Analytics**                                                   |
| :----------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/6e984edc-ca9a-46a8-9b0e-ad8da9d61d71" alt="Add Order" width="200"/> | <img src="https://github.com/user-attachments/assets/88b82f39-f46c-4daa-9df1-29d3ceccd158" alt="Pending Orders" width="200"/> | <img src="https://github.com/user-attachments/assets/f8c7e3c1-1fe8-4b54-87d7-30476cf44dc4" alt="Reports" width="200"/> |
|                                         Intuitive order creation with validation                                         |                                            Real-time order tracking and management                                            |                                           Comprehensive analytics dashboard                                            |

</div>

### Complete User Journey

<div align="center">

|                                                      **Empty State**                                                       |                                                    **Form Validation**                                                    |                                                  **Success Feedback**                                                  |
| :------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: |
| <img src="https://github.com/user-attachments/assets/7e562dbc-fd94-4fde-98e3-43c9b7ef140e" alt="Empty State" width="180"/> | <img src="https://github.com/user-attachments/assets/82e084ce-bac3-4319-bede-9c0fb2d7454d" alt="Validation" width="180"/> | <img src="https://github.com/user-attachments/assets/8e0f4d36-4964-446c-a5d9-962945e83add" alt="Success" width="180"/> |

</div>

---

## Quick Start Guide

### Prerequisites

Ensure you have the following installed:

```bash
Flutter SDK (3.8.1+)
Dart SDK
Android Studio / VS Code
Android/iOS device or emulator
```

### Installation & Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/smart-ahwa-manager.git
   cd smart-ahwa-manager
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Verify installation**

   ```bash
   flutter doctor
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

### Development Commands

```bash
# Run in debug mode
flutter run --debug

# Build for production
flutter build apk --release

# Run tests
flutter test

# Analyze code quality
flutter analyze
```

---

## Tech Stack & Dependencies

<div align="center">

|     **Category**     |   **Technology**   | **Version** |        **Purpose**         |
| :------------------: | :----------------: | :---------: | :------------------------: |
|    **Framework**     |      Flutter       |   3.8.1+    | Cross-platform development |
|     **Language**     |        Dart        |    3.0+     |    Programming language    |
|    **UI Design**     | Material Design 3  |   Latest    |    Modern design system    |
|   **Architecture**   | Clean Architecture |      -      | Scalable code organization |
| **State Management** |   StatefulWidget   |  Built-in   |    UI state management     |

</div>

---

## Contributing

We welcome contributions! Here's how you can help:

1. **Fork** the repository
2. **Create** your feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Contribution Guidelines

- Follow the existing code style and architecture
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Connect With Me

<div align="center">

[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:a7medhanyshokry@gmail.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/theahmedhany/)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/theahmedhany)

</div>

---

<div align="center">
  
### If you found this project helpful, please give it a star!

**Made with care by Ahmed Hany**

</div>
