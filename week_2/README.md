# Anime Discovery Hub 🎌✨

<div align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Material%20Design-757575?style=for-the-badge&logo=material-design&logoColor=white" alt="Material Design"/>
</div>

A modern Flutter application for discovering and exploring anime content, built with clean architecture and modern UI/UX principles. This app demonstrates professional Flutter development practices, responsive design, and beautiful user interfaces for anime enthusiasts.

## 📱 Features

### Core Functionality

- **Anime Discovery**: Browse and explore a vast collection of anime content
- **Smart Filtering**: Filter anime by categories (All, Popular, Trending, New Releases, Action, Adventure)
- **Character Showcase**: Discover and explore top anime characters
- **Detailed Views**: Comprehensive anime details with categories and information
- **Premium Plans**: Upgrade to premium plans for enhanced features
- **Interactive Navigation**: Smooth navigation with custom bottom navigation bar

### Technical Features

- **Clean Architecture**: Feature-based modular architecture with separation of concerns
- **Responsive Design**: Adaptive UI that works on various screen sizes using ScreenUtil
- **Custom Components**: Reusable widgets and components for consistent design
- **Modern UI**: Beautiful gradient backgrounds and SVG illustrations
- **State Management**: Efficient state handling with StatefulWidget and StatelessWidget
- **Custom Theming**: Consistent color scheme and typography throughout the app

## 🏗️ Architecture

The app follows a clean, feature-based architecture:

```
lib/
├── main.dart                           # Application entry point
├── core/                              # Shared resources and utilities
│   ├── apis/                          # Network layer and API services
│   ├── common/                        # Shared constants and configurations
│   ├── di/                           # Dependency injection setup
│   ├── helpers/                      # Utility functions and extensions
│   ├── theme/                        # Application theming system
│   │   └── app_color.dart           # Color palette and design tokens
│   └── utils/                        # Common utilities and helpers
└── features/                          # Feature-based modules
    ├── home/                         # Home screen feature module
    │   └── presentation/
    │       ├── screens/
    │       │   └── home_screen.dart
    │       └── widgets/
    │           ├── all_anime_carousel.dart
    │           ├── custom_bottom_nav.dart
    │           ├── filter_list_view.dart
    │           └── top_characters.dart
    ├── details/                      # Anime details feature module
    │   └── presentation/
    │       ├── screens/
    │       │   └── details_screen.dart
    │       └── widgets/
    │           ├── custom_category_card.dart
    │           ├── custom_info_row.dart
    │           ├── details_buttons_row.dart
    │           ├── details_custom_button.dart
    │           └── details_image_section.dart
    └── plans/                        # Premium plans feature module
        └── presentation/
            ├── screens/
            │   └── upgrade_plan_screen.dart
            └── widgets/
                ├── custom_plan_button.dart
                └── upgrade_plan_container.dart
```

## 🎨 UI/UX Features

### Design Elements

- **Gradient Backgrounds**: Beautiful blue gradient overlays for visual appeal
- **SVG Illustrations**: Custom star and decorative elements for brand consistency
- **Custom Navigation**: Intuitive bottom navigation with Google Nav Bar
- **Responsive Layout**: Adaptive design using Flutter ScreenUtil
- **Visual Feedback**: Smooth transitions and interactive elements

### User Experience

- **Intuitive Discovery**: Easy-to-use filtering and browsing interface
- **Character Focus**: Dedicated section for exploring anime characters
- **Detailed Information**: Comprehensive anime details with category tags
- **Premium Integration**: Seamless upgrade flow for premium features
- **Modern Interface**: Clean, contemporary design following Material Design principles

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/theahmedhany/flutter_mentors_mentorship.git
   cd flutter_mentors_mentorship/week_2
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

- **flutter_screenutil**: Responsive UI framework for different screen sizes
- **flutter_svg**: SVG rendering support for custom illustrations
- **google_nav_bar**: Modern bottom navigation bar component

## 📊 App Screens

### 1. Home Screen

- Dynamic anime carousel showcasing featured content
- Interactive filter tabs for different anime categories
- Top characters section with character showcase
- Beautiful gradient background with decorative elements
- Custom bottom navigation for easy access to features

<table>
  <tr>
    <td> <img width="300" height="600" alt="Image" src="https://github.com/user-attachments/assets/745e0c53-bb84-4a62-9a48-de86b55dd2f3" /> </td>
  </tr>
</table>

### 2. Details Screen

- Comprehensive anime information display
- Category tags for quick genre identification
- Rich image section with anime posters
- Action buttons for user interactions
- Dark theme for immersive viewing experience

<table>
  <tr>
    <td> <img width="300" height="600" alt="Image" src="https://github.com/user-attachments/assets/be093350-3ef8-4b0d-811c-19446d2ab25d" /> </td>
    <td> <img width="300" height="600" alt="Image" src="https://github.com/user-attachments/assets/ddfd3e1e-1dc8-49f3-a760-49f20b7cf18f" /> </td>
  </tr>
</table>

### 3. Upgrade Plans Screen

- Premium subscription options and features
- Interactive plan selection with custom buttons
- Compelling visual design to encourage upgrades
- Decorative elements maintaining brand consistency
- Clear upgrade paths and benefits presentation

<table>
  <tr>
    <td> <img width="300" height="600" alt="Image" src="https://github.com/user-attachments/assets/0a984056-b833-4043-918c-991c031f15c9" /> </td>
  </tr>
</table>

## 🎯 Key Features

### Anime Discovery

- Browse extensive anime catalog
- Filter by popularity, trends, and genres
- Discover new releases and classics

### Character Exploration

- Dedicated character showcase section
- Top characters from popular anime series
- Interactive character browsing experience

### Premium Experience

- Upgrade plans for enhanced features
- Premium content access
- Ad-free browsing experience

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
