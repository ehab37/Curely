# Curely 🏥

Curely is a professional-grade personal health management application built with Flutter. It empowers users to organize their medical history, manage medications with smart reminders, and interact with an AI health assistant—all within a secure and highly localized experience.

## 🎨 Mockup

### ☀️ English & Light Mockup
<img width="4020" height="1000" alt="1" src="https://github.com/user-attachments/assets/38c35184-b488-4edb-b002-313d21dda970" />

### 🌑 Arabic & Dark Mockup
<img width="4020" height="1000" alt="2" src="https://github.com/user-attachments/assets/4937fe49-5946-49f3-a09f-63bfccaa3194" />

## 🌟 Key Features

### 🔐 Secure Authentication
*   **Multi-Provider Login:** Seamlessly sign in with **Email/Password** or **Google Sign-in**.
*   **User Lifecycle:** Comprehensive flows for **Registration**, **Password Reset**, and **Account Deletion**.
*   **Legal Compliance:** Integrated **Terms & Conditions** acceptance flow to ensure user data privacy awareness.

### 📋 Intelligent Health Dashboard
*   **Unified Medical Records:** Centralized management for all your health data.
*   **Medication Management:** Track current and past medicines with detailed usage instructions and notes.
*   **Digital Archive:** Securely store and categorize **Prescriptions**, **Radiology Reports (Rays)**, and **Lab Analysis** results.
*   **Visual Images:** Attach and view medical images and download them directly within the app.

### 🤖 Dr. Curely (AI Health Consultant)
*   **Advanced AI Integration:** Powered by **Gemini AI** to provide empathetic and professional health guidance.
*   **Symptom Assessment:** Describe symptoms to receive preliminary advice and next-step recommendations.
*   **Safety First:** Built-in emergency detection that advises immediate medical contact for life-threatening symptoms.
*   **24/7 Availability:** Instant access to health information anytime, anywhere.

### 🔔 Smart Reminders & Notifications
*   **Medication Alerts:** Never miss a dose with scheduled daily or periodic notifications.
*   **Flexible Scheduling:** Support for various frequencies (once daily, every 8 hours, etc.) with precise time selection.

### 🌍 Personalized Experience
*   **Full Localization:** Native support for **English** and **Arabic** with RTL (Right-to-Left) UI optimization.
*   **Dynamic Theming:** Premium **Light** and **Dark Mode** support that adapts to system settings or user preference.
*   **Biometric Data:** Track vital statistics like **Blood Type**, **Weight (kg)**, **Height (cm)**, and **Age**.
*   **Search & Favorites:** Quickly find records or mark critical information for instant access.

## 🛠 Tech Stack

*   **UI Framework:** [Flutter](https://flutter.dev/) (SDK ^3.8.1)
*   **State Management:** [Flutter BLoC/Cubit](https://pub.dev/packages/flutter_bloc) for predictable state transitions.
*   **Architecture:** **Clean Architecture** (Data, Domain, Presentation) for high maintainability.
*   **Backend Services:** [Firebase](https://firebase.google.com/) (Authentication, Cloud Firestore, Firebase Storage).
*   **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it) for decoupled service management.
*   **Networking:** [Dio](https://pub.dev/packages/dio) for robust HTTP requests.
*   **Navigation:** [GoRouter](https://pub.dev/packages/go_router) with custom [GoTransitions](https://pub.dev/packages/go_transitions).
*   **AI Engine:** [Gemini AI](https://pub.dev/packages/gemini_ai) for the health assistant.
*   **Internationalization:** [Easy Localization](https://pub.dev/packages/easy_localization).
*   **Local Storage:** [Shared Preferences](https://pub.dev/packages/shared_preferences) for caching app state.

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK (^3.8.1)
*   A Firebase project with Android/iOS apps configured.

### Configuration
1.  **Environment Variables:** Create a `.env` file in the root directory and add your API keys:
    ```env
    # Gemini AI Key
    GEMINI_API_KEY=your_gemini_key
    ```
2.  **Firebase Setup:** Download and place your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in the respective platform directories.

### Installation
1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/curely.git
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the application:
    ```bash
    flutter run
    ```

---
**⚠️ Medical Disclaimer:** *Curely is an AI-powered assistant designed for informational purposes only. It is NOT a substitute for professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare provider for any medical concerns or emergencies.*
