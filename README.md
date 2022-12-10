# Gaude

An Expense Tracking App built with Flutter and Firebase.  
The UI of this app is inspired by [this](https://www.figma.com/community/file/998557875473123405) figma design by [@brajaomar](https://www.figma.com/@brajaomar).

**Disclamer**: This app is not production ready and I can't promise I will ever finish building it.

## Getting Started

This app uses Firebase for authentication and error reporting but no Firebase configuration is part of this repository, therefore you need to create your own Firebase project and configure it with this app. Learn more about how to do that [here](https://firebase.google.com/docs/flutter/setup).

On Android, the app uses two flavors: Dev and Prod; there is no difference between them except for the Firebase configuration.
Flavors configurations have not yet been done for iOS.

### Run the app

```shell
$ flutter run --flavor dev lib/main.dart
```

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features

- [ ] Authentication

  - [x] Sign in with Google
  - [x] Sign out
  - [ ] Sign in with email and password
  - [ ] Reset password

- [x] Crash Reporting
  - [x] Report errors to Firebase Crashlytics
  - [x] Logs errors to the console
