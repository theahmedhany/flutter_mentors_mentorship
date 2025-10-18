# 🐾 Pet Finder App

A modern, feature-rich Flutter application that helps users discover and explore different cat breeds using The Cat API. Built with clean architecture principles and state-of-the-art Flutter development practices.

[![Flutter Version](https://img.shields.io/badge/Flutter-3.8.1+-02569B?logo=flutter)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.8.1+-0175C2?logo=dart)](https://dart.dev/)

## 📱 Screenshots

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/890faea8-6f32-47f7-8213-24dbd2f75648" alt="Onboarding Screen" width="230"/></td>
    <td><img src="https://github.com/user-attachments/assets/065a9321-6c8d-4e21-a4ba-e759db1ae338" alt="Splash Screen" width="230"/></td>
    <td><img src="https://github.com/user-attachments/assets/f36000e1-7468-4657-8792-0466bd9beb1b" alt="Home Screen" width="230"/></td>
  </tr>
</table>

## ✨ Features

### Core Functionality

- 🐱 **Browse Cat Breeds** - Explore a comprehensive list of cat breeds from around the world
- 🔍 **Search & Filter** - Easily find specific breeds with intuitive search functionality
- 📊 **Detailed Information** - View detailed breed information including:
  - Temperament and personality traits
  - Origin and history
  - Life expectancy
  - Weight specifications (Imperial & Metric)
  - High-quality breed images
- 🎯 **Category Navigation** - Browse pets by different categories
- 📱 **Responsive Design** - Beautiful UI that adapts to different screen sizes
- 🌊 **Smooth Onboarding** - Welcoming first-time user experience

### Technical Features

- 🏗️ **Clean Architecture** - Separation of concerns with data, domain, and presentation layers
- 🔄 **State Management** - Efficient state handling using BLoC/Cubit pattern
- 🌐 **API Integration** - RESTful API integration with Retrofit
- 💾 **Data Caching** - Optimized image caching for better performance
- 🔐 **Secure Storage** - Secure local data storage capabilities
- ⚡ **Dependency Injection** - GetIt for efficient dependency management
- 🧪 **Comprehensive Testing** - Unit, widget, and integration tests included
- 📊 **Error Handling** - Graceful error states with retry mechanisms
- 🎨 **Shimmer Loading** - Elegant loading states for better UX

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a feature-first approach:

```
lib/
├── core/
│   ├── di/                    # Dependency Injection setup
│   ├── helpers/               # Helper utilities
│   ├── networking/            # API configuration & Dio setup
│   ├── routing/               # App navigation & routing
│   ├── theming/               # Theme, colors, and styles
│   └── widgets/               # Reusable widgets
│
└── features/
    ├── onboarding/
    │   └── presentation/      # Onboarding UI
    │       ├── screens/
    │       └── widgets/
    │
    └── home/
        ├── data/
        │   ├── apis/          # API services & endpoints
        │   ├── models/        # Data models
        │   └── repos/         # Repository implementations
        ├── domain/
        │   └── repos/         # Repository interfaces
        └── presentation/
            ├── cubit/         # State management
            ├── screens/       # UI screens
            └── widgets/       # Feature-specific widgets
```

### Design Patterns Used

- **Repository Pattern** - Abstracts data sources
- **BLoC Pattern** - Predictable state management
- **Dependency Injection** - Loose coupling and testability
- **Factory Pattern** - Dio instance creation
- **Freezed** - Immutable state and data classes

## 🛠️ Tech Stack

### Core Dependencies

- **Flutter SDK** (^3.8.1) - UI framework
- **Dart** (^3.8.1) - Programming language

### State Management & Architecture

- **flutter_bloc** (^8.1.6) - State management
- **get_it** (^8.2.0) - Dependency injection
- **freezed** (^3.2.3) - Code generation for unions/pattern matching
- **freezed_annotation** (^3.1.0) - Freezed annotations

### Networking & API

- **dio** (^5.9.0) - HTTP client
- **retrofit** (^4.7.3) - Type-safe REST client
- **retrofit_generator** (^10.0.6) - Retrofit code generation
- **pretty_dio_logger** (^1.4.0) - Beautiful API logs
- **json_serializable** (^6.11.1) - JSON serialization

### UI & UX

- **flutter_screenutil** (^5.9.3) - Responsive design
- **cached_network_image** (^3.4.1) - Image caching
- **shimmer** (^3.0.0) - Loading animations
- **flutter_native_splash** (^2.4.7) - Native splash screen

### Storage

- **shared_preferences** (^2.5.3) - Local key-value storage
- **flutter_secure_storage** (^9.2.4) - Secure storage

### Testing

- **flutter_test** - Widget testing
- **mockito** (^5.4.4) - Mock objects
- **mocktail** (^1.0.3) - Mock library
- **bloc_test** (^9.1.5) - BLoC testing utilities
- **integration_test** - Integration testing

## 📋 Prerequisites

Before running this project, ensure you have:

- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.8.1 or higher)
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio with Flutter plugins
- A physical device or emulator

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/theahmedhany/flutter_mentors_mentorship.git
cd flutter_mentors_mentorship/week_4
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Required Files

This project uses code generation. Run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the App

```bash
# For debug mode
flutter run

# For release mode
flutter run --release

# For specific device
flutter run -d <device-id>
```

### 5. Run Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/unit/cubit/home_cubit_test.dart

# Run integration tests
flutter test integration_test/
```

## 🧪 Testing

The project includes comprehensive testing:

### Test Structure

```
test/
├── helpers/              # Test helpers and utilities
├── unit/
│   ├── cubit/           # Cubit/BLoC tests
│   └── repos/           # Repository tests
└── widget/              # Widget tests
    └── home_widgets/    # Home feature widget tests
```

### Running Tests

```bash
# Unit tests
flutter test test/unit/

# Widget tests
flutter test test/widget/

# Integration tests
flutter test integration_test/

# Generate coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📦 Build & Release

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

### iOS

```bash
# Build for iOS
flutter build ios --release

# Build IPA
flutter build ipa --release
```

### Web

```bash
flutter build web --release
```

## 🔧 Configuration

### API Configuration

The app uses The Cat API. The base URL is configured in:

```dart
lib/core/networking/api_constants.dart
```

### Splash Screen

Customize the splash screen in `pubspec.yaml`:

```yaml
flutter_native_splash:
  color: "#FFFFFF"
  image: assets/images/splash_screen.png
```

To regenerate splash screens:

```bash
flutter pub run flutter_native_splash:create
```

## 📁 Project Structure Details

### Feature Module Structure

Each feature follows this structure:

- **data/** - Data sources, models, and repository implementations
- **domain/** - Business logic and repository interfaces
- **presentation/** - UI components, state management

### Core Module

- **di/** - Dependency injection setup with GetIt
- **networking/** - Dio configuration and API constants
- **routing/** - App navigation and route management
- **theming/** - App colors, text styles, themes
- **widgets/** - Reusable UI components

## 🎨 Design System

The app uses a consistent design system:

- **Color Palette** - Defined in `lib/core/theming/app_colors.dart`
- **Typography** - Text styles in theming folder
- **Spacing** - Consistent spacing helpers
- **Components** - Reusable widgets in `lib/core/widgets/`

---
