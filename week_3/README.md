# Laza - E-Commerce Flutter App

<div align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>
</div>

A modern and feature-rich e-commerce mobile application built with Flutter, showcasing clean architecture, state management with BLoC pattern, and a beautiful user interface.

<table>
  <tr>
    <td> <img width="100%" alt="Laza" src="https://github.com/user-attachments/assets/451a3f22-15e5-4a9b-8c77-db78384b1f31" /> </td>
  </tr>
</table>

## 🚀 How to Run the App

### Prerequisites

- Flutter SDK (version 3.8.1 or higher)
- Dart SDK (version 3.8.1 or higher)
- Android Studio / VS Code with Flutter plugins
- An Android device or emulator / iOS device or simulator

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/theahmedhany/flutter_mentors_mentorship.git
   cd flutter_mentors_mentorship/week_3
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code (for freezed, json_serializable, retrofit)**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Build for Release

#### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

#### iOS

```bash
flutter build ios --release
```

## Features Implemented

### Authentication System

- **User Registration**: Complete signup flow with email validation
- **Email Verification**: OTP-based email verification system
- **User Login**: Secure login with JWT token management
- **Persistent Sessions**: Auto-login functionality using secure storage
- **Password Security**: Secure password handling and storage

<table>
  <tr>
    <td> <img width="260" alt="Onboarding Screen" src="https://github.com/user-attachments/assets/59da2de9-7a15-49d4-ba87-f7db3c516e0a" /> </td>
    <td> <img width="260" alt="Signup Screen" src="https://github.com/user-attachments/assets/0354693a-b172-40a2-b633-355878f09865" /> </td>
    <td> <img width="260" alt="Verify Email Screen" src="https://github.com/user-attachments/assets/7bc3312c-e99e-4242-a7f4-610d5daee5d4" /> </td>
    <td> <img width="260" alt="OTP Screen" src="https://github.com/user-attachments/assets/0243b945-3888-4868-8a3e-5e4bce7398a8" /> </td>
  </tr>
</table>

### Home & Navigation

- **Bottom Navigation**: Clean navigation between Home, Favorites, and Profile
- **Home Dashboard**: Welcome screen with brand showcase and product highlights
- **Search Functionality**: Product search with intuitive UI
- **Category Navigation**: Easy access to different product categories

<table>
  <tr>
    <td> <img width="260" alt="Splash Screen" src="https://github.com/user-attachments/assets/254a4978-e559-4b5e-972a-7da1b1557403" /> </td>
    <td> <img width="260" alt="Home Screen" src="https://github.com/user-attachments/assets/d274a0d7-3ea5-4b76-99b1-49d5e55f5e3c" /> </td>
    <td> <img width="260" alt="Favorites Screen" src="https://github.com/user-attachments/assets/f8e2f51e-ec17-49bc-87a7-d3fcca4d589f" /> </td>
    <td> <img width="260" alt="User Screen" src="https://github.com/user-attachments/assets/82228094-3a9e-43fb-8f1b-9bd3ad26cd43" /> </td>
  </tr>
</table>

### Product Management

- **Product Catalog**: Complete list of available products with pagination
- **Product Details**: Detailed product view with images, descriptions, and pricing
- **Brand Catalog**: Browse products by brand categories
- **Product Images**: High-quality cached images with loading states

<table>
  <tr>
    <td> <img width="260" alt="Products Screen" src="https://github.com/user-attachments/assets/21671027-357f-4250-8c77-9cf4d682cf6c" /> </td>
    <td> <img width="260" alt="Favorites Screen" src="https://github.com/user-attachments/assets/dfc919e8-2cfe-427d-a5f0-ae6b1ee6a910" /> </td>
    <td> <img width="260" alt="Details Screen" src="https://github.com/user-attachments/assets/34452a54-5157-4ae8-b26e-b74bdb8c325c" /> </td>
    <td> <img width="260" alt="Brands Screen" src="https://github.com/user-attachments/assets/4a289669-f41e-4319-90c1-7403c9715810" /> </td>
  </tr>
</table>

### Favorites System

- **Add to Favorites**: Mark products as favorites with visual feedback
- **Favorites Management**: View and manage favorite products
- **Persistent Storage**: Favorites saved locally using SharedPreferences
- **Real-time Updates**: Instant UI updates when toggling favorites
- **State Management**: Robust state management using BLoC pattern with Freezed

### User Profile

- **Profile Display**: User profile information and avatar
- **Profile Management**: View and edit user details
- **Settings**: App settings and preferences

### UI/UX Features

- **Material Design**: Beautiful Material Design 3 components
- **Responsive Design**: Adaptive UI for different screen sizes using ScreenUtil
- **Loading States**: Elegant loading indicators and shimmer effects
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Pull-to-Refresh**: Refresh functionality for data updates
- **Smooth Animations**: Fluid transitions and animations

### Technical Features

- **Offline Support**: Local data caching for better user experience
- **Network Monitoring**: Smart network error handling
- **Secure Storage**: Encrypted storage for sensitive data
- **Clean Architecture**: Well-organized code structure following clean architecture principles
- **State Management**: BLoC pattern with Cubit for reactive state management
- **Dependency Injection**: GetIt for efficient dependency management

## API Endpoints Used

### Base URL

```
https://accessories-eshop.runasp.net/api/
```

### Authentication Endpoints

- **POST** `/auth/register` - User registration
- **POST** `/auth/login` - User login
- **POST** `/auth/verify-email` - Email verification with OTP
- **POST** `/auth/resend-otp` - Resend OTP for email verification
- **GET** `/auth/me` - Get user profile information

### Product Endpoints

- **GET** `/products` - Get all products
- **GET** `/products/{id}` - Get specific product details

### Category Endpoints

- **GET** `/categories` - Get all product categories/brands

## Project Architecture

### Clean Architecture Structure

```
lib/
├── core/                           # Core functionality
│   ├── common/                     # Shared widgets and components
│   ├── di/                         # Dependency injection setup
│   ├── helpers/                    # Utility functions and helpers
│   ├── networking/                 # API services and network handling
│   ├── routing/                    # App navigation and routing
│   ├── theme/                      # App theming and colors
│   └── utils/                      # Constants and utilities
├── features/                       # Feature-based modules
│   ├── brands/                     # Brand catalog feature
│   ├── details/                    # Product details feature
│   ├── favorite/                   # Favorites management feature
│   ├── home/                       # Home screen and navigation
│   ├── login/                      # User authentication
│   ├── onboarding/                 # App onboarding
│   ├── products/                   # Product catalog
│   ├── profile/                    # User profile management
│   ├── signup/                     # User registration
│   └── verify_email/               # Email verification
└── main.dart                       # App entry point
```

### Each Feature Module Structure

```
feature/
├── data/
│   ├── models/                     # Data models and DTOs
│   └── repos/                      # Repository implementations
├── presentation/
│   ├── logic/                      # BLoC/Cubit state management
│   ├── screens/                    # UI screens
│   └── widgets/                    # Feature-specific widgets
```

## 📦 Key Dependencies

### State Management & Architecture

- **flutter_bloc** (^9.1.1) - BLoC pattern for state management
- **get_it** (^8.2.0) - Dependency injection
- **freezed** (^3.2.3) - Code generation for immutable classes

### Networking & Data

- **dio** (^5.9.0) - HTTP client for API calls
- **retrofit** (^4.7.3) - Type-safe HTTP client generator
- **json_annotation** (^4.9.0) - JSON serialization annotations
- **shared_preferences** (^2.5.3) - Local data persistence
- **flutter_secure_storage** (^9.2.4) - Secure local storage

### UI & UX

- **flutter_screenutil** (^5.9.3) - Responsive design
- **cached_network_image** (^3.4.1) - Efficient image loading and caching
- **flutter_svg** (^2.2.1) - SVG image support
- **shimmer** (^3.0.0) - Loading shimmer effects
- **pinput** (^5.0.1) - OTP input field

### Development Tools

- **build_runner** (^2.9.0) - Code generation
- **json_serializable** (^6.11.1) - JSON serialization code generation
- **retrofit_generator** (^10.0.6) - Retrofit code generation
- **pretty_dio_logger** (^1.4.0) - HTTP request logging
- **logger** (^2.6.2) - Logging utility

## Development Setup

### Code Generation

The project uses code generation for several features. Run the following command when you modify:

- Freezed classes
- JSON serializable models
- Retrofit API services

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Project Configuration

- **Minimum SDK**: Android API 21, iOS 12.0
- **Target SDK**: Latest stable versions
- **Splash Screen**: Custom splash screen with app branding
- **App Icons**: Configured for all platforms

## 📈 Performance Optimizations

- **Image Caching**: Efficient image loading with automatic caching
- **State Management**: Optimized state updates to prevent unnecessary rebuilds
- **Network Optimization**: Request/response interceptors for better API handling
- **Memory Management**: Proper disposal of resources and controllers
- **Lazy Loading**: On-demand loading of heavy resources

## 🔒 Security Features

- **Secure Storage**: Sensitive data encrypted using flutter_secure_storage
- **Token Management**: JWT tokens securely stored and automatically refreshed
- **API Security**: Proper authentication headers and error handling
- **Input Validation**: Client-side validation for all user inputs

---

## Demo and Resources

#### To see **Laza** in action, check out the video below:

---
