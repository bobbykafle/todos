# 📝 Flutter To‑Do App

A feature‑rich **Flutter To‑Do application** with Firebase Authentication, Firestore CRUD operations, OTP authentication, notifications, theming, and task categorization. This project is designed as a practical example of building a modern, scalable Flutter app.

---

## 🚀 Features

* 🔐 **Authentication**

  * Firebase Email/Password Authentication
  * OTP-based authentication (non‑Firebase database)
  * Login, Signup, Forgot Password, and Sign Out

* ✅ **Task Management**

  * Create, Read, Update, Delete (CRUD) tasks using Firestore
  * Task categories & detailed task views
  * Today-focused tasks & task overview section

* ⏰ **Notifications**

  * Local task notifications
  * Time picker integration

* 🎨 **UI & UX**

  * Light/Dark theme switching
  * Custom theme colors
  * Clean, modular widget structure

* 🔍 **Utilities**

  * Search tasks
  * Drawer navigation
  * Reusable widgets & components

---

## 🧱 Project Structure

```
lib/
├── authentication/
│   ├── auth.dart
│   ├── auth_provider.dart
│   ├── login.dart
│   ├── signup.dart
│   ├── otp.dart
│   └── forgect_password.dart
│
├── category/
│   ├── category_list.dart
│   └── category_detail_page.dart
│
├── home/
│   ├── drawer.dart
│   ├── overview_section.dart
│   ├── today_focused.dart
│   └── search_bar_page.dart
│
├── tasks/
│   ├── task_item.dart
│   ├── task_list.dart
│   └── task_page.dart
│
├── Notification/
│   ├── notification_services.dart
│   ├── todo_notification.dart
│   └── time_picker.dart
│
├── ThemeChange/
│   ├── theme_chenge.dart
│   ├── theme_color.dart
│   └── theme_page.dart
│
├── widgets/
│   ├── app_text.dart
│   ├── button.dart
│   ├── component.dart
│   └── about_app.dart
│
├── add_task_dialog.dart
├── curd_database.dart
├── remove_page.dart
├── task_providr.dart
├── sign_out.dart
├── home.dart
└── main.dart
```

---

## 🛠 Tech Stack

* **Flutter** (Dart)
* **Firebase Authentication**
* **Cloud Firestore**
* **Provider** (State Management)
* **Local Notifications**

---

## 🏁 Getting Started

### Prerequisites

* Flutter SDK installed
* Firebase project set up
* Android Studio / VS Code

### Installation

```bash
git clone https://github.com/your-username/to_do_app.git
cd to_do_app
flutter pub get
flutter run
```

### Firebase Setup (Required)

This app uses **Firebase Authentication** and **Cloud Firestore**.

1. Create a Firebase project in the Firebase Console.
2. Add an **Android app** and/or **iOS app** to the project.
3. Download the configuration files:

   * `google-services.json` → place in `android/app/`
   * `GoogleService-Info.plist` → place in `ios/Runner/`
4. Enable **Authentication** (Email/Password) and **Cloud Firestore** in Firebase.
5. Run the app again:

```bash
flutter run
```

> ⚠️ **Firebase Setup Required:** This app uses Firebase Authentication and Firestore. To run it, create your own Firebase project and add the required configuration files for Android and/or iOS as described in the Firebase documentation.

---

## 📚 Resources

* [Flutter Documentation](https://docs.flutter.dev)
* [Firebase for Flutter](https://firebase.flutter.dev)
* [Flutter Cookbook](https://docs.flutter.dev/cookbook)

---

## 📄 About

This project demonstrates how to build a **real‑world Flutter application** with authentication, cloud data, notifications, and theming. Ideal for learning, experimentation, or as a starter template for production apps.

---

**Author:** Babita Kafle
✨ Happy coding!
