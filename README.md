# Curely

Curely is a comprehensive personal health management application built with Flutter. It helps users keep track of their medical records, manage prescriptions, and interact with an AI health assistant.

## Features

### 🔐 Authentication
*   **Multi-provider Login:** Support for Email/Password and Google Sign-in.
*   **Secure Registration:** Easy account creation with profile setup.
*   **Password Management:** Reset password functionality.
*   **Terms & Conditions:** Integrated legal acceptance flow.

### 📋 Health Dashboard
*   **Medical Records:** Organize and manage your health history in one place.
*   **Medicines:** Track your current and past medications.
*   **Prescriptions:** Digital storage for your doctor's prescriptions.
*   **Rays & Analysis:** Store and view radiology reports and lab analysis results.
*   **Add Records:** Intuitive forms to add new medical data with image attachment support.

### 🤖 Doctor AI (Dr. Curely)
*   **AI Health Assistant:** Chat with an AI-powered medical assistant for health-related inquiries.
*   **Symptom Guidance:** Get preliminary information about various symptoms (disclaimer provided).
*   **Always Available:** Dr. Curely is accessible 24/7 for quick health guidance.

### 🏠 Home & Discovery
*   **Personalized Experience:** Greeting and quick access to features.
*   **Search:** Find health resources or records easily.
*   **Favorites:** Mark important items for quick access.

### 👤 Profile Management
*   **User Info:** View and edit personal details like blood type, height, and weight.
*   **Localization:** Support for English and Arabic languages.
*   **Theme Support:** Consistent and modern UI with custom theming.

## Tech Stack
*   **Frontend:** Flutter
*   **State Management:** Flutter Bloc
*   **Backend:** Firebase (Auth, Firestore, Storage)
*   **Dependency Injection:** GetIt
*   **Networking:** Dio
*   **Navigation:** GoRouter
*   **Environment Config:** Flutter Dotenv

## Getting Started

### Prerequisites
*   Flutter SDK (^3.8.1)
*   A Firebase project

### Secure Configuration
This project uses `flutter_dotenv` to manage sensitive API keys. 

1.  Create a `.env` file in the root directory.
2.  Add your configuration keys (see `.env.example` or the template below):

```env
FIREBASE_WEB_API_KEY=your_key
FIREBASE_WEB_APP_ID=your_id
...
GOOGLE_SERVER_CLIENT_ID=your_id
```

3.  Run the app:
```bash
flutter run
```

---
*Note: This project is a medical assistant tool. Always consult with a professional doctor for medical emergencies.*
