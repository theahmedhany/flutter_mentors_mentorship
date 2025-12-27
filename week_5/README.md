# uStock - Stock Investment Learning Platform

<div align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Fastlane-00F200?style=for-the-badge&logo=fastlane&logoColor=white" alt="Fastlane"/>
  <img src="https://img.shields.io/badge/BLoC-6C63FF?style=for-the-badge&logo=flutter&logoColor=white" alt="BLoC"/>
</div>

A modern stock investment learning application built with Flutter, featuring clean architecture, BLoC state management, Firebase integration, and automated CI/CD deployment with Fastlane and Firebase App Distribution.

## 📱 How to Run the App

### Prerequisites

- Flutter SDK (version 3.9.2 or higher)
- Dart SDK (version 3.9.2 or higher)
- Android Studio / VS Code with Flutter plugins
- An Android device or emulator / iOS device or simulator
- Firebase project configured (for CI/CD features)
- Ruby and Fastlane installed (for automated deployment)

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/flutter_mentors_mentorship.git
   cd flutter_mentors_mentorship/week_5
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
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

### 📊 Core Features

- **Profile Management**: User profile display with personalized information
  - User avatar display
  - Investor type classification
  - Profile settings access
- **Personal Data Management**: Comprehensive personal information form

  - Editable name field
  - Date of birth picker with formatted display
  - Job/occupation input
  - Monthly income selector with dropdown
  - Gender selection with radio buttons
  - Profile picture with camera upload option
  - Real-time form validation

- **Community Forum**: Educational content platform
  - "Learn Stock, Educate the World" educational hub
  - Forum posts with rich information
  - Real-time search functionality
  - User engagement tracking
  - Member avatars display
  - Post descriptions and summaries
  - "Join Forum" call-to-action buttons

### 🎨 UI/UX Features

- **Material Design 3**: Modern, beautiful interface following latest Material Design guidelines
- **Professional Color Scheme**:
  - Primary: Modern Blue (#4C6FFF)
  - Background: Light Grey (#F8F9FB)
  - Card Background: White (#FFFFFF)
  - High contrast text for accessibility
- **Google Fonts Integration**: Clean typography using Inter font family
- **Responsive Design**: Adaptive UI for all screen sizes
- **Smooth Animations**:
  - Page transitions
  - Form interactions
  - Button hover effects
- **Interactive Elements**:
  - Bottom navigation bar
  - Clickable menu tiles with icons
  - Date picker popup
  - Bottom sheet selectors
  - Radio button selections
  - Search bar with real-time filtering

### 🧱 Clean Architecture

- **Feature-Based Structure**: Modular organization by features
  - Profile feature
  - Personal Data feature
  - Community feature
- **Separation of Concerns**: Clear separation between layers
  - Data Layer (Models)
  - Presentation Layer (UI & State)
  - Shared Components
- **SOLID Principles**: Following best practices for maintainable code
- **Reusable Components**: Shared widgets across features

### 🔄 State Management

- **BLoC Pattern**: Predictable state management using flutter_bloc
  - ProfileCubit: Manages user profile state
  - PersonalDataCubit: Handles form state and updates
  - CommunityCubit: Manages forum posts and search
- **Equatable Integration**: Value equality for state classes
- **Immutable State**: Ensures predictable state transitions
- **CopyWith Pattern**: Safe state updates without mutations

### 🚀 CI/CD & Automation

- **Firebase Integration**:
  - Firebase Core setup for Android and iOS
  - Firebase App Distribution for beta testing
  - Automated deployment pipeline
- **Fastlane Automation**:
  - Automated build process
  - APK distribution to testers
  - Release notes generation
  - Firebase App Distribution integration
- **Google Services**:
  - Firebase project configuration
  - Multi-platform support (Android/iOS)
  - Cloud-based distribution

### 📱 Navigation & Routing

- **Named Routes**: Clean navigation with route constants
- **Route Generator**: Centralized routing logic
- **Back Navigation**: Proper navigation stack management
- **Deep Linking Ready**: Structure supports deep linking

---

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/090d9933-4fa9-4791-b44f-7d1c5b4a4d5b" alt="Profile Screen" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/7579106d-dcdb-4e20-a247-125b8767f37d" alt="Personal Data Screen" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/8f2b4c07-2274-4c04-a83d-9aae5f280814" alt="Community Screen" width="250"/></td>
  </tr>
</table>

---

## 🏗️ Project Architecture

### Clean Architecture Structure

```
lib/
├── core/                           # Core functionality and shared resources
│   ├── theme/                      # App theming
│   │   ├── app_colors.dart         # Color palette definitions
│   │   ├── app_text_styles.dart    # Typography styles
│   │   └── app_theme.dart          # Theme configuration
│   └── routes/                     # App navigation and routing
│       └── app_router.dart         # Route generator and constants
│
├── features/                       # Feature-based modules
│   ├── profile/                    # Profile feature
│   │   ├── data/
│   │   │   └── models/
│   │   │       └── user_profile.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── profile_cubit.dart
│   │       │   └── profile_state.dart
│   │       └── pages/
│   │           └── profile_page.dart
│   │
│   ├── personal_data/              # Personal data management
│   │   ├── data/
│   │   │   └── models/
│   │   │       └── personal_data.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── personal_data_cubit.dart
│   │       │   └── personal_data_state.dart
│   │       └── pages/
│   │           └── personal_data_page.dart
│   │
│   └── community/                  # Community forum
│       ├── data/
│       │   └── models/
│       │       └── forum_post.dart
│       └── presentation/
│           ├── cubit/
│           │   ├── community_cubit.dart
│           │   └── community_state.dart
│           ├── pages/
│           │   └── community_page.dart
│           └── widgets/
│               └── forum_card.dart
│
├── shared/                         # Shared components
│   └── widgets/                    # Reusable widgets
│       ├── custom_text_field.dart
│       └── menu_tile.dart
│
├── firebase_options.dart           # Firebase configuration
└── main.dart                       # App entry point
```

### Feature Module Structure

Each feature follows a clean architecture pattern:

```
feature/
├── data/
│   └── models/                     # Data models with Equatable
│       └── feature_model.dart
└── presentation/
    ├── cubit/                      # BLoC/Cubit state management
    │   ├── feature_cubit.dart
    │   └── feature_state.dart
    ├── pages/                      # UI screens
    │   └── feature_page.dart
    └── widgets/                    # Feature-specific widgets
        └── feature_widget.dart
```

## 📦 Key Dependencies

### State Management & Architecture

- **flutter_bloc** (^8.1.6) - BLoC pattern for predictable state management
- **equatable** (^2.0.5) - Value equality for model classes

### UI & Design

- **google_fonts** (^6.2.1) - Beautiful typography with Inter font family
- **flutter_svg** (^2.0.10+1) - SVG support for vector graphics
- **cupertino_icons** (^1.0.8) - iOS-style icons

### Firebase & Backend

- **firebase_core** (^4.3.0) - Firebase SDK core functionality
- Firebase App Distribution integration for beta testing
- Cloud-based configuration and services

### Utilities

- **intl** (^0.19.0) - Internationalization and date formatting

### Development Tools

- **flutter_lints** (^5.0.0) - Recommended Flutter linting rules
- **flutter_test** - Flutter testing framework

## 🚀 CI/CD Pipeline

### Fastlane Configuration

The project includes a complete Fastlane setup for automated deployment:

#### Fastfile Configuration

```ruby
default_platform(:android)

platform :android do
  desc "Distribute the app to Firebase App Distribution"
  lane :distribute do
    sh "flutter clean"
    sh "flutter build apk --release"
    firebase_app_distribution(
      app: "1:677807517470:android:2ea5e9fb07d4bb5b44230f",
      firebase_cli_token: "YOUR_FIREBASE_TOKEN",
      android_artifact_type: "APK",
      android_artifact_path: "../build/app/outputs/flutter-apk/app-release.apk",
      testers: "tester_1@example.com, tester_2@example.com",
      release_notes: "New release with bug fixes and improvements"
    )
  end
end
```

### Deployment Process

1. **Build Preparation**:
   - Clean build artifacts
   - Flutter build in release mode
2. **Distribution**:

   - Upload APK to Firebase App Distribution
   - Notify testers via email
   - Include release notes

3. **Testing**:
   - Automated distribution to beta testers
   - Feedback collection through Firebase

### Firebase Setup

- **Project ID**: cicd-f9682
- **Package Name**: com.example.week_5
- **Platforms**: Android & iOS
- **Services**: App Distribution, Cloud Storage

### Running Fastlane

```bash
# Navigate to android directory
cd android

# Install dependencies
bundle install

# Run distribution lane
bundle exec fastlane distribute
```

## 🎨 Design System

### Color Palette

```dart
// Primary Colors
primary: #4C6FFF (Modern Blue)
primaryDark: #3451E3 (Dark Blue)

// Background Colors
background: #F8F9FB (Light Grey)
cardBackground: #FFFFFF (White)
inputBackground: #F5F6FA (Input Grey)

// Text Colors
textPrimary: #1A1D1F (Dark)
textSecondary: #6F767E (Medium)
textHint: #9CA4AB (Light)

// Accent Colors
success: #00BA88 (Green)
warning: #FFA043 (Orange)
error: #FF6A55 (Red)
info: #2E5BFF (Blue)
```

### Typography

Using **Inter** font family from Google Fonts:

- **H1**: 32px, Bold
- **H2**: 24px, Bold
- **H3**: 20px, SemiBold
- **H4**: 18px, SemiBold
- **Body Large**: 16px, Regular
- **Body Medium**: 14px, Regular
- **Body Small**: 12px, Regular
- **Button**: 16px, SemiBold
- **Caption**: 12px, Regular

### UI Components

- **Cards**: 16px border radius, white background, subtle shadow
- **Buttons**: 12px border radius, primary color, elevation 0
- **Input Fields**: 12px border radius, filled style, no border
- **Bottom Navigation**: Fixed, 4 items, icon-based navigation

## 📱 Screens Overview

### 1. Profile Screen

**Features**:

- User profile header with avatar and name
- Investor type display
- Navigation menu with 7 sections:
  - Personal Data
  - Settings
  - E-Statement
  - Referral Code
  - FAQs
  - Our Handbook
  - Community
- Help/Support banner
- Bottom navigation bar

**State Management**: ProfileCubit

- ProfileInitial: Loading state
- ProfileLoaded: Profile data available

### 2. Personal Data Screen

**Features**:

- Profile picture with camera icon
- Personal information form:
  - Name input field
  - Date of birth picker
  - Job/occupation input
  - Monthly income dropdown selector
  - Gender radio buttons (Male/Female)
- Real-time field updates
- Form validation ready
- Save functionality

**State Management**: PersonalDataCubit

- PersonalDataInitial: Loading state
- PersonalDataLoaded: Form data available
- PersonalDataUpdating: Saving in progress
- PersonalDataUpdated: Save successful

### 3. Community Screen

**Features**:

- Educational header: "Learn Stock, Educate the World"
- Search bar with real-time filtering
- Forum post cards showing:
  - Post title
  - Description (2 lines, ellipsis)
  - User avatars (stacked, up to 3)
  - Additional members count indicator
  - "Join Forum" button
- Smooth scrolling list
- Empty state handling

**State Management**: CommunityCubit

- CommunityInitial: Loading state
- CommunityLoaded: Posts loaded with search results

## 🛠️ Development Setup

### Code Quality

- **Linting**: Strict Flutter linting rules enabled
- **Analysis Options**: Comprehensive static analysis
- **Code Formatting**: Consistent code style enforcement

### Project Configuration

- **Minimum SDK**: Android API 21, iOS 12.0
- **Target SDK**: Latest stable versions
- **Null Safety**: Full null safety support
- **Material Design**: Material Design 3 components

### Running in Development

```bash
# Run on connected device
flutter run

# Run on specific device
flutter run -d chrome
flutter run -d android
flutter run -d ios

# Run with release mode
flutter run --release
```

## 🔐 Firebase Configuration

### Android Configuration

File: `android/app/google-services.json`

```json
{
  "project_info": {
    "project_number": "677807517470",
    "project_id": "cicd-f9682",
    "storage_bucket": "cicd-f9682.firebasestorage.app"
  }
}
```

### iOS Configuration

Platform-specific Firebase options configured in `lib/firebase_options.dart`:

```dart
static const FirebaseOptions ios = FirebaseOptions(
  apiKey: 'AIzaSyDg0i7CPbgVitUv77XacXl9dWNT22f4TUE',
  appId: '1:677807517470:ios:29bc889daeefd10844230f',
  messagingSenderId: '677807517470',
  projectId: 'cicd-f9682',
  storageBucket: 'cicd-f9682.firebasestorage.app',
  iosBundleId: 'com.example.week5',
);
```

## ⚡ Performance Optimizations

- **State Optimization**: Minimized rebuilds with BLoC pattern
- **Lazy Loading**: On-demand widget creation
- **Const Constructors**: Compile-time constant widgets
- **Memory Management**: Proper disposal of resources
- **Build Optimization**: Release builds with code optimization

## 🎯 State Management Flow

### ProfileCubit Flow

```dart
ProfileInitial → ProfileLoaded(UserProfile)
```

### PersonalDataCubit Flow

```dart
PersonalDataInitial
  → PersonalDataLoaded(PersonalData)
  → PersonalDataUpdating
  → PersonalDataUpdated(PersonalData)
  → PersonalDataLoaded(PersonalData)
```

### CommunityCubit Flow

```dart
CommunityInitial
  → CommunityLoaded(posts, filteredPosts)
  → [Search] → CommunityLoaded(posts, newFilteredPosts)
```

---
