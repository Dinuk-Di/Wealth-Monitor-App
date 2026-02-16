# WealthOrbit 🪐

**The All-in-One Personal Finance & Wealth Ecosystem**

WealthOrbit is a premium, cross-platform Flutter application designed to be your ultimate financial command center. It unifies expense tracking, investment portfolio management (CSE Stocks, Fixed Income), and predictive analytics into a single, beautiful interface.

## ✨ Features

- **🔐 Secure Authentication**: Google Sign-In via Firebase.
- **💸 Smart Wallet**: Track daily income and expenses with ease.
- **📈 Investment Portfolio**: Manage Equity (CSE) and Fixed Income (FD, T-Bills/Bonds) in one place.
- **📊 Dashboard**: Real-time Net Worth tracking and visual analytics.
- **🧠 Local AI Predictions (Coming Soon)**: On-device spending forecasts using TensorFlow Lite.

## 🛠 Tech Stack

- **Framework**: Flutter (Dart)
- **Architecture**: Clean Architecture + Riverpod
- **Database**: Isar (Local NoSQL)
- **Auth**: Firebase Auth
- **UI**: Custom "Cyber Finance" Dark Theme

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Dart SDK
- Firebase Project configured

### Installation

1.  **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/wealth_orbit.git
    cd wealth_orbit
    ```

2.  **Install Dependencies**:

    ```bash
    flutter pub get
    ```

3.  **Generate Code (Isar Models)**:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Configure Firebase**:
    - Place `google-services.json` in `android/app/`.
    - Place `GoogleService-Info.plist` in `ios/Runner/`.

5.  **Run the App**:
    ```bash
    flutter run
    ```

## ⚠️ Known Issues

- None at the moment.

## License

MIT License.
