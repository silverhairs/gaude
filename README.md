# Gaude

[![build](https://github.com/silverhairs/gaude/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/silverhairs/gaude/actions/workflows/build.yaml)

An Expense Tracking App built with Flutter and Firebase. The UI of this app is inspired by [this](https://www.figma.com/community/file/998557875473123405) figma design by [@brajaomar](https://www.figma.com/@brajaomar).

**Disclamer**: This app is not production ready and I can't promise I will ever finish building it.

## Getting Started

This app uses Firebase for authentication and error reporting but no Firebase configuration is part of this repository, therefore you need to create your own Firebase project and configure it with this app. Learn more about how to do that [here](https://firebase.google.com/docs/flutter/setup).

On Android, the app uses two flavors: Dev and Prod; there is no difference between them except for the Firebase configuration.
Flavors configurations have not yet been done for iOS.

### Run the app

```shell
$ flutter run --flavor dev lib/main.dart
```

### Testing

The testing approach in this app is Full Tree Widget Testing which is well described by [@freewheelnat](https://github.com/freewheelnat) in [this](https://cogitas.net/unleash-full-power-flutter-widget-tests/) article. Basically, we spin up a new instance of the app for each test and interact with it as a user would and then make assertions that all the requirements are met. We mock Repositories or Data Sources to avoid making network calls or interacting with the database and inject the mocks to the higher layers of the app.

```shell
$ flutter test
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
