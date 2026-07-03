# Gym Management App

A comprehensive and easy-to-use Flutter application for managing gym members. This application allows gym owners or administrators to easily track memberships, user details, and active plans directly from their devices.

## Features

- **Member Management**: Add, view, and manage gym members.
- **Detailed Profiles**: Store essential member information including name, phone number, email, and membership plan.
- **Membership Tracking**: Track join dates and calculate membership expiry dates automatically.
- **Local Storage**: Completely offline support with fast and secure local database using [Hive](https://pub.dev/packages/hive).
- **State Management**: Reactive and robust state management powered by [Provider](https://pub.dev/packages/provider).
- **Theming**: Includes dynamic theme support (Light and Dark mode) for better user experience.

## Technologies Used

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **Local Database**: Hive (`hive`, `hive_flutter`, `hive_generator`)
- **State Management**: Provider
- **Utilities**: 
  - `intl` for Date/Time formatting
  - `uuid` for generating unique member identifiers

## Getting Started

Follow these steps to get a copy of the project up and running on your local machine.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.12.0 or higher recommended)
- An IDE (like VS Code or Android Studio) with Flutter & Dart plugins installed.

### Installation

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone https://github.com/tausifkhan89/Gym_Management.git
   cd Gym_Management
   ```

2. **Install dependencies**:
   Run the following command to fetch all the required packages.
   ```bash
   flutter pub get
   ```

3. **Generate Hive Adapters** (if modifying models):
   If you make changes to the `GymMemberModel`, you will need to regenerate the Hive adapters:
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/models/`: Contains data models like `GymMemberModel` and Hive generated files.
- `lib/providers/`: State management providers (`gym_provider.dart`, `theme_provider.dart`).
- `lib/screens/`: UI screens (`home_screen.dart`, `add_member_screen.dart`, `member_profile.dart`, etc.).
- `lib/widgets/`: Reusable custom UI components.
- `lib/theme/`: App theme configurations.

## License

This project is open-source and available for educational and personal use.
