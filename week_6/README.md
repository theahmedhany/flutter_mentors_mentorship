# MovieHub - Movie Discovery App

<div align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>
  <img src="https://img.shields.io/badge/Hive-FF6F00?style=for-the-badge&logo=hive&logoColor=white" alt="Hive"/>
  <img src="https://img.shields.io/badge/Sentry-362D59?style=for-the-badge&logo=sentry&logoColor=white" alt="Sentry"/>
</div>

A sophisticated movie discovery application built with Flutter, featuring clean architecture, offline-first caching strategy, advanced state management with BLoC pattern, error monitoring with Sentry, and a beautiful responsive UI with light/dark theme support.

<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/8ff07215-d689-4850-8724-db02ab18602e" alt="MovieHub" />
    </td>
  </tr>
</table>

## 📱 How to Run the App

### Prerequisites

- Flutter SDK (version 3.9.2 or higher)
- Dart SDK (version 3.9.2 or higher)
- Android Studio / VS Code with Flutter plugins
- An Android device or emulator / iOS device or simulator
- TMDB API Key (for accessing The Movie Database API)

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/flutter_mentors_mentorship.git
   cd flutter_mentors_mentorship/week_6
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code (for freezed, json_serializable, retrofit, hive)**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Configure API Keys**

   Update the API key in `lib/core/networking/api_constants.dart`:

   ```dart
   static const String apiKey = "YOUR_TMDB_API_KEY";
   ```

5. **Run the app**
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

## ✨ Features Implemented

### 🎬 Movie Discovery

- **Popular Movies Catalog**: Browse an extensive collection of popular movies from TMDB
- **Infinite Scroll**: Seamless pagination with lazy loading for smooth browsing experience
- **Pull-to-Refresh**: Update movie catalog with a simple swipe gesture
- **Movie Details**: Comprehensive movie information including:
  - High-quality poster and backdrop images
  - Full synopsis and overview
  - Release date and runtime
  - User ratings and vote count
  - Genres and production companies
  - Production countries and spoken languages
  - Budget and revenue information
  - Tagline and current status

### 💾 Advanced Caching System

- **Offline-First Architecture**: Full app functionality without internet connection
- **Hive Local Database**: Fast, efficient NoSQL database for local storage
- **Smart Caching Strategy**:
  - Cache movies by page for optimized memory usage
  - Automatic cache updates on successful API calls
  - Cache indicators showing data source (online/offline)
  - Page-level caching for pagination support
- **Persistent Data**: All movie data and details persist across app sessions
- **Type-Safe Caching**: Custom Hive adapters for all model classes

### 🎨 UI/UX Features

- **Material Design 3**: Modern, beautiful interface following Material Design guidelines
- **Light & Dark Themes**:
  - Seamless theme switching
  - System theme detection
  - Theme persistence across sessions
  - Optimized colors for both themes
- **Responsive Design**: Adaptive UI using ScreenUtil for all screen sizes
- **Smooth Animations**:
  - Lottie animations for loading states
  - Hero animations for image transitions
  - Fluid page transitions
- **Cached Images**: Fast image loading with automatic caching using CachedNetworkImage
- **Loading States**: Beautiful Lottie animations during data fetching
- **Empty States**: User-friendly messages when no data is available
- **Error Handling**: Comprehensive error messages with retry options

### 🧱 Clean Architecture

- **Feature-Based Structure**: Modular organization by features
- **Separation of Concerns**: Clear separation between data, domain, and presentation layers
- **Dependency Injection**: GetIt for efficient dependency management
- **Repository Pattern**: Abstract data sources from business logic
- **SOLID Principles**: Following best practices for maintainable code

### 🔄 State Management

- **BLoC Pattern**: Predictable state management using flutter_bloc
- **Freezed Integration**: Immutable state classes with union types
- **Loading More State**: Dedicated state for pagination loading
- **Cache Indicators**: State includes information about data source
- **Error Recovery**: Graceful error handling with fallback to cached data

### 🛡️ Error Monitoring & Quality

- **Sentry Integration**: Real-time error tracking and performance monitoring
- **Comprehensive Error Handling**:
  - Network errors
  - API errors (400, 401, 403, 404, 500, etc.)
  - Cache errors
  - Timeout handling
- **User-Friendly Messages**: Clear error messages for all error scenarios
- **Retry Mechanisms**: Allow users to retry failed operations
- **Debug Logging**: Pretty Dio logger for API request/response debugging

### 🚀 Performance Optimizations

- **Lazy Loading**: Load movies on-demand with pagination
- **Image Caching**: Reduce bandwidth with efficient image caching
- **State Preservation**: Maintain scroll position and loaded data
- **Duplicate Prevention**: Prevent loading duplicate movies in pagination
- **Memory Management**: Proper disposal of resources and controllers
- **Efficient Rebuilds**: Optimized widget rebuilds with BLoC

### 🎭 Additional Features

- **Device Preview**: Test app on multiple device sizes during development
- **Secure Storage**: Encrypted storage for sensitive data using flutter_secure_storage
- **Shared Preferences**: Lightweight key-value storage for app settings
- **Theme Persistence**: Remember user's theme preference
- **Immersive Mode**: Full-screen experience with transparent status bar

<table align="center">
  <tr>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/a1d395d8-a4a0-4686-84b9-0d35a6a8411b" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/82598991-d252-4dee-9f71-e31ef357e344" alt="MovieHub" />
    </td>
  </tr>
  <tr>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/492139bf-eb2d-43e3-83e9-f54589e280ad" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/68ac9496-6b4b-4464-a78f-38a417cb016f" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/2aa60d10-2e1f-4f88-aa7b-74ae6a531239" alt="MovieHub" />
    </td>
  </tr>
    <tr>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/576bcecc-c9b1-4b5a-b4fa-f1b3264314a9" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/f296a592-e522-46e0-836f-5ff023c62d8a" alt="MovieHub" />
    </td>
  </tr>
</table>

## 🌐 API Endpoints Used

### Base URL

```
https://api.themoviedb.org/3/
```

### Movie Endpoints

- **GET** `/movie/popular` - Get popular movies

  - Query Parameters:
    - `page`: Page number for pagination
  - Headers:
    - `Authorization`: Bearer token with TMDB API key

- **GET** `/movie/{movie_id}` - Get detailed movie information
  - Path Parameters:
    - `movie_id`: Unique movie identifier
  - Headers:
    - `Authorization`: Bearer token with TMDB API key

## 🏗️ Project Architecture

### Clean Architecture Structure

```
lib/
├── core/                           # Core functionality and shared resources
│   ├── cache/                      # Caching infrastructure
│   │   ├── hive_cache_adapters.dart    # Register all Hive type adapters
│   │   └── hive_cache_service.dart     # Abstract cache service interface
│   ├── common/                     # Shared widgets and components
│   ├── di/                         # Dependency injection setup
│   │   └── dependency_injection.dart   # GetIt service locator
│   ├── helpers/                    # Utility functions and helpers
│   │   └── shared_pref_helper.dart     # SharedPreferences wrapper
│   ├── networking/                 # API services and network handling
│   │   ├── api_constants.dart          # API URLs and error messages
│   │   ├── api_error_handler.dart      # Centralized error handling
│   │   ├── api_error_model.dart        # Error response model
│   │   ├── api_network_exceptions.dart # Network exception handling
│   │   ├── api_result.dart             # Result wrapper with Freezed
│   │   ├── api_services.dart           # Retrofit API service definitions
│   │   └── dio_factory.dart            # Dio client configuration
│   ├── routing/                    # App navigation and routing
│   │   ├── app_router.dart             # Route generator
│   │   └── routes.dart                 # Route constants
│   └── theme/                      # App theming
│       ├── theme_data/                 # Theme configurations
│       │   ├── dark_theme_data.dart    # Dark theme configuration
│       │   └── light_theme_data.dart   # Light theme configuration
│       └── theme_manager/              # Theme state management
│           └── theme_cubit.dart        # Theme switching logic
├── features/                       # Feature-based modules
│   ├── details/                    # Movie details feature
│   │   ├── data/
│   │   │   ├── cache/
│   │   │   │   └── movie_details_cache_service.dart
│   │   │   ├── models/
│   │   │   │   └── movie_details_model.dart
│   │   │   └── repos/
│   │   │       └── movie_details_repo.dart
│   │   └── presentation/
│   │       ├── logic/
│   │       │   ├── movie_details_cubit.dart
│   │       │   └── movie_details_state.dart
│   │       ├── screens/
│   │       │   └── movie_details_screen.dart
│   │       └── widgets/
│   │           ├── additional_info_section.dart
│   │           ├── movie_description_section.dart
│   │           └── [other detail widgets]
│   └── home/                       # Home screen feature
│       ├── data/
│       │   ├── cache/
│       │   │   └── movies_cache_service.dart
│       │   ├── models/
│       │   │   └── all_movies_model.dart
│       │   └── repos/
│       │       └── all_movies_repo.dart
│       └── presentation/
│           ├── logic/
│           │   ├── all_movies_cubit.dart
│           │   └── all_movies_state.dart
│           ├── screens/
│           │   └── home_screen.dart
│           └── widgets/
│               ├── all_movies_card.dart
│               ├── all_movies_list.dart
│               └── [other home widgets]
└── main.dart                       # App entry point
```

### Feature Module Structure

Each feature follows a clean architecture pattern:

```
feature/
├── data/
│   ├── cache/                      # Local caching layer
│   │   └── feature_cache_service.dart
│   ├── models/                     # Data models and DTOs
│   │   └── feature_model.dart
│   └── repos/                      # Repository implementations
│       └── feature_repo.dart
└── presentation/
    ├── logic/                      # BLoC/Cubit state management
    │   ├── feature_cubit.dart
    │   └── feature_state.dart
    ├── screens/                    # UI screens
    │   └── feature_screen.dart
    └── widgets/                    # Feature-specific widgets
        └── feature_widget.dart
```

## 📦 Key Dependencies

### State Management & Architecture

- **flutter_bloc** (^9.1.1) - BLoC pattern for predictable state management
- **get_it** (^8.2.0) - Service locator for dependency injection
- **freezed** (^2.5.2) & **freezed_annotation** (^2.4.4) - Code generation for immutable classes and unions
- **json_annotation** (^4.9.0) - JSON serialization annotations

### Networking & Data

- **dio** (^5.7.0) - Powerful HTTP client for API calls
- **retrofit** (^4.7.3) - Type-safe HTTP client generator
- **pretty_dio_logger** (^1.4.0) - Beautiful logging for HTTP requests/responses
- **json_serializable** (^6.8.0) - JSON serialization code generation
- **retrofit_generator** (^7.0.8) - Code generator for Retrofit

### Local Storage & Caching

- **hive** (^2.2.3) - Fast, lightweight NoSQL database
- **hive_flutter** (^1.1.0) - Hive implementation for Flutter
- **hive_generator** (^2.0.1) - Code generator for Hive type adapters
- **shared_preferences** (^2.5.3) - Simple key-value storage
- **flutter_secure_storage** (^9.2.4) - Secure encrypted storage

### UI & UX

- **flutter_screenutil** (^5.9.3) - Responsive design and screen adaptation
- **cached_network_image** (^3.4.1) - Efficient image loading and caching
- **lottie** (^3.3.1) - Beautiful animations from JSON files
- **cupertino_icons** (^1.0.8) - iOS-style icons

### Error Monitoring & Debugging

- **sentry_flutter** (^9.7.0) - Real-time error tracking and performance monitoring
- **logger** (^2.6.2) - Elegant logging utility

### Development Tools

- **device_preview** (^1.2.0) - Test app on multiple device configurations
- **build_runner** (^2.4.13) - Code generation runner
- **flutter_lints** (^5.0.0) - Recommended Flutter linting rules
- **flutter_test** - Flutter testing framework

<table align="center" style="border-collapse: collapse; text-align: center;">
  <tr>
    <td colspan="3"></td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/d32dca3d-205a-4ad3-996a-a43589fb4158" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/ea272621-4ee7-4c61-a53f-230341bb34cc" alt="MovieHub" />
    </td>
    <td colspan="3"></td>
  </tr>

  <tr>
    <td colspan="2"></td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/6dff2ce5-9a76-4d1b-b759-8289b9c546be" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/1633f34b-1555-403d-b695-d9df34ca3197" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/14683de8-bf13-46ae-bc3b-f55038cb8ea9" alt="MovieHub" />
    </td>
    <td colspan="2"></td>
  </tr>

  <tr>
    <td colspan="3"></td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/380e51af-ef7e-4842-860e-a39c81a76aca" alt="MovieHub" />
    </td>
    <td>
      <img height="300" src="https://github.com/user-attachments/assets/fc55430e-c204-48d1-af97-23d334e684f0" alt="MovieHub" />
    </td>
    <td colspan="3"></td>
  </tr>
</table>

## 🛠️ Development Setup

### Code Generation

The project uses code generation for several features. Run this command when you modify:

- Freezed classes (State classes)
- JSON serializable models
- Retrofit API services
- Hive type adapters

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Watch Mode (Development)

For continuous code generation during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Project Configuration

- **Minimum SDK**: Android API 21, iOS 12.0
- **Target SDK**: Latest stable versions
- **Null Safety**: Full null safety support
- **Material Design**: Material Design 3 components

## 🗄️ Caching Strategy

### Offline-First Architecture

The app implements an offline-first caching strategy for optimal user experience:

1. **Initial Load**:

   - Check local cache first
   - Display cached data immediately if available
   - Fetch fresh data from API in background
   - Update UI when fresh data arrives

2. **Pagination**:

   - Cache each page separately
   - Load from cache before fetching new page
   - Merge results intelligently (no duplicates)

3. **Movie Details**:

   - Cache individual movie details by ID
   - Show cached details instantly
   - Update with fresh data when available

4. **Error Handling**:
   - Fall back to cached data on network errors
   - Continue showing cached data even when offline
   - Clear indicators showing data source

## 🔐 Security Features

- **Secure Storage**: Sensitive data encrypted using flutter_secure_storage
- **API Key Protection**: API keys properly configured and not exposed
- **HTTPS Only**: All API communications over secure HTTPS
- **Error Sanitization**: Sensitive information removed from error logs
- **Input Validation**: Proper validation of all user inputs

## ⚡ Performance Optimizations

- **Image Caching**: Automatic image caching with CachedNetworkImage
- **Lazy Loading**: On-demand loading with infinite scroll pagination
- **State Optimization**: Minimized rebuilds with BLoC pattern
- **Cache Strategy**: Smart caching reduces API calls and improves offline experience
- **Memory Management**: Proper disposal of resources
- **Build Optimization**: Release builds with code optimization
- **Duplicate Prevention**: Intelligent merging of paginated results

## 🎨 Theme System

### Light & Dark Theme Support

```dart
// Theme Cubit with Persistence
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadSavedTheme();
  }

  Future<void> updateTheme(ThemeMode newMode) async {
    await SharedPrefHelper.setData(key: _themeKey, value: newMode.index);
    emit(newMode);
  }
}
```

Features:

- Seamless switching between light, dark, and system themes
- Theme persistence across app sessions
- Custom color schemes for both themes
- Consistent Material Design 3 components

## 📊 Error Monitoring

### Sentry Integration

Real-time error tracking and performance monitoring:

```dart
await SentryFlutter.init(
  (options) {
    options.dsn = 'YOUR_SENTRY_DSN';
    options.sendDefaultPii = true;
  },
  appRunner: () => runApp(MyApp()),
);
```

Features:

- Real-time crash reporting
- Performance monitoring
- Breadcrumbs for debugging
- User feedback collection
- Release health tracking

---
