# 📍 GeoMemo – Favorite Places App



**A beautifully crafted Flutter app for saving and organizing your favorite places**  
*Capture memories - Explore locations - Relive moments*



---

## 🎯 Overview

Transform the way you discover and remember special places with **GeoMemo**—a thoughtfully designed Flutter application that combines photography, location services, and intuitive organization to help you create a personal map of meaningful locations. Whether it's that perfect coffee shop, a scenic viewpoint, or your favorite restaurant, GeoMemo helps you never forget where the magic happens.

---

## ✨ Features

- 📍 **Precise Location Tracking:** GPS and interactive map integration for accurate positioning.
- 📷 **Integrated Photography:** Capture moments with seamless camera integration.
- 🗺️ **Interactive Mapping:** Beautiful map visualization with custom markers.
- 💾 **Offline-First Design:** All data stored locally with SQLite for reliability.
- 🔄 **Reactive Architecture:** Smooth state management with Riverpod.
- 📊 **Smart Place Management:** Add, organize, search, and update places with rich details.
- 🎨 **Modern User Experience:** Clean, intuitive interface with smooth animations and responsive layout.

---

## 🏗️ Architecture

### Project Structure

```
lib/
├── main.dart                        # Application entry point
├── helpers/                         # Utility & Configuration
│   ├── api_credentials.dart         # API keys and credentials
│   ├── database_helper.dart         # SQLite database operations
│   ├── location_helper.dart         # Location services & geocoding
│   └── constants.dart               # App-wide constants
├── models/                          # Data Models
│   ├── place.dart                   # Place data structure
│   ├── location.dart                # Location coordinates model
│   └── photo.dart                   # Photo metadata model
├── providers/                       # State Management (Riverpod)
│   ├── place_provider.dart          # Places state management
│   ├── location_provider.dart       # Location state management
│   ├── photo_provider.dart          # Photo management provider
│   └── app_state_provider.dart      # Global app state
├── screens/                         # UI Screens
│   ├── home_screen.dart             # Main dashboard
│   ├── add_place_screen.dart        # Add new place form
│   ├── place_detail_screen.dart     # Place details view
│   ├── map_screen.dart              # Interactive map interface
│   └── settings_screen.dart         # App settings
└── widgets/                         # Reusable UI Components
    ├── place_item.dart              # Place list item widget
    ├── image_input.dart             # Photo capture widget
    ├── location_input.dart          # Location picker widget
    ├── custom_app_bar.dart          # Custom app bar
    └── loading_indicator.dart       # Loading animations
```

---

## 🚀 Quick Start

### Prerequisites

- **Flutter SDK** (≥ 3.0.0)  
- **IDE:** Android Studio, VS Code, or IntelliJ IDEA  
- **Google Maps API Key**  
- **Device:** Android Emulator, iOS Simulator, or Physical Device  
- **Git**

### Installation

```
# 1. Clone the repository
git clone https://github.com/priyanshjain117/GeoMemo.git
cd GeoMemo

# 2. Install dependencies
flutter pub get

# 3. Configure API credentials
# Create lib/helpers/api_credentials.dart with your API keys

# 4. Run the app
flutter run
```

**API Configuration Example:**

```
// lib/helpers/api_credentials.dart
class ApiCredentials {
  static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
  static const String geocodingApiKey = 'YOUR_GEOCODING_API_KEY';
}
```

**Android Permissions:**

```




```

**iOS Permissions:**

```
NSCameraUsageDescription
GeoMemo needs camera access to capture photos of your favorite places
NSLocationWhenInUseUsageDescription
GeoMemo needs location access to save precise coordinates
```

---

## 🛠️ Tech Stack

| Technology  | Purpose           | Version  |
|-------------|-------------------|----------|
| Flutter     | UI Framework      | ≥ 3.0.0  |
| Dart        | Programming Lang  | ≥ 2.18.0 |
| Riverpod    | State Management  | ^2.4.0   |
| SQLite      | Local Database    | ^2.3.0   |
| Google Maps | Mapping Services  | ^2.5.0   |

---

## 📖 Documentation

For detailed feature breakdowns, code samples, and testing instructions, refer to the [Documentation](#-documentation) section in the project files.

---

## 🤝 Contributing

We welcome contributions from the community! See [CONTRIBUTING.md](https://github.com/priyanshjain117/GeoMemo/blob/main/CONTRIBUTING.md) for guidelines on reporting issues, suggesting features, and making code contributions.

---

## 📄 License

This project is licensed under the **MIT License**—see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **Flutter Team** for the cross-platform framework  
- **Riverpod Community** for state management solutions  
- **Google Maps Team** for mapping services  
- **OpenStreetMap** for open-source mapping data  
- **Material Design** for design guidelines  
- **SQLite Team** for reliable local database solutions  
- **Open Source Community** for inspiration and feedback  

---

## 🌟 Show Your Support

- ⭐ **Star this repository**  
- 🍴 **Fork it**  
- 📢 **Share it**  
- 🐛 **Report issues**  
- 💡 **Suggest features**  
- 🤝 **Contribute code**  

---

## 📬 Connect & Support

| Platform    | Link                                                                 | Purpose                 |
|-------------|----------------------------------------------------------------------|-------------------------|
| 📧 Email    | [jainpriyanshu117@gmail.com](mailto:jainpriyanshu117@gmail.com)      | Direct contact          |
| 💼 LinkedIn | [Priyanshu Jain](https://www.linkedin.com/in/priyanshu-jain-995b08322/) | Professional networking |
| 🐙 GitHub   | [@priyanshjain117](https://github.com/priyanshjain117)               | More projects           |

---

## 🚀 Future Roadmap

- ☁️ **Cloud Sync:** Firebase integration for cross-device synchronization  
- 🏷️ **Smart Categories:** AI-powered place categorization  
- 🤝 **Social Sharing:** Share favorite places with friends  
- 🌙 **Dark Mode:** Complete dark theme implementation  
- 📤 **Export Options:** GPX, KML, and JSON export formats  
- 🔍 **Advanced Search:** Full-text search with intelligent filters  
- 📱 **Widget Support:** Home screen widgets for quick access  
- 🎯 **Visit Tracking:** Check-in functionality with visit history  

---



*"Every place has a story. GeoMemo helps you remember yours."*  

**Happy Place Tracking! 📍✨**


```

**Feel free to customize any part as needed!**