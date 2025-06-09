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
- 📊 **Smart Place Management:** Add and organize places with rich details.
- 🎨 **Modern User Experience:** Clean, intuitive interface with smooth animations and responsive layout.

---

## 🏗️ Architecture

### Project Structure

```
lib/
├── main.dart                        # Application entry point
├── helpers/                         # Utility & Configuration
│   └── apikey.dart         # API keys and credentials
├── models/                          # Data Models
│   └── place.dart                   # Place data structure
├── providers/
│   └── user_places.dart             # Places state management
├── screens/                         # UI Screens
│   ├── home_screen.dart             # Main dashboard
│   ├── add_place_screen.dart        # Add new place form
│   ├── place_detail_screen.dart     # Place details view
│   └── map_screen.dart              # Interactive map interface
└── widgets/                         # Reusable UI Components
    ├── fav_place_list_item.dart     # Place list item widget
    ├── image_input.dart             # Photo capture widget
    ├── location_input.dart          # Location picker widget
    └── empty_screen_info.dart       # Empty screen widget 
```

---

## 🚀 Quick Start

### Prerequisites

- **Flutter SDK** (≥ 3.0.0)  
- **IDE:** Android Studio, VS Code, or IntelliJ IDEA  
- **opencagedata API Key**  
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
| flutter_map | Mapping Services  | ^8.1.1   |

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