# Gaude

[![build](https://github.com/silverhairs/gaude/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/silverhairs/gaude/actions/workflows/build.yaml)

An Expense Tracking App built with Flutter and Firebase. The UI of this app is inspired by [this](https://www.figma.com/community/file/998557875473123405) figma design by [@brajaomar](https://www.figma.com/@brajaomar).

**Disclamer**: This app is not production ready and I can't promise I will ever finish building it on time.

## Getting Started

This app uses Firebase for authentication, storing remote data, and error reporting but no Firebase configuration is part of this repository, therefore you need to create your own Firebase project and configure it with this app. Learn more about how to do that [here](https://firebase.google.com/docs/flutter/setup).

The app uses two flavors: Dev and Prod. The prod entry point is not ready yet, so you can only run the dev flavor.

### Run the app

```shell
$ flutter run --flavor dev
```

### Testing

The testing approach in this app is Full Tree Widget Testing which is well described by [@freewheelnat](https://github.com/freewheelnat) in [this](https://cogitas.net/unleash-full-power-flutter-widget-tests/) article. Basically, we spin up a new instance of the app for each test and interact with it as a user would and then make assertions that all the requirements are met. We external components such as database or http requests to avoid making network calls or interacting with the database, then we inject the mocks to the higher layers of the app.

The tests are located in the `test` directory where you can find the file structure that matches the app's file structure. For example, the tests for the `src/app` module are located in `test/src/app`.

Besides the testing files, you will find a `utils` directory where you can find the mocks for the external components and multiple helper functions to make testing easier.

```shell
$ flutter test
```

## Console Logging

To log state changes and errors captured by blocs in the console while the app is running, you need to specify it when running the app. Logs are categorized into levels; depending on which level you enable when running the app some logs will be ignored. Each level is identified by a number, where `0` is the lowest (all logs are shown) and `6` is the highest(nothing is shown). The levels are:

```txt
verbose = 0,
debug = 1,
info = 2,
warning = 3,
error = 4,
wtf = 5,
nothing = 6,
```

The enabled level only shows logs with the same or higher level. For example, if you enable level `3` (warning): info and debug logs will be ignored but warning, error and wtf logs will be shown.

If the level is not specified, the default level will be set by the `AppConfig` class. To run the app with a logging level, you need to pass a value to the `log_level` command attribute like this:

```sh
flutter run --flavor dev --dart-define=log_level=<your-log-level-index> # for example: --dart-define=log_level=0
```

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Firebase

The only firebase services currently used by the app are Firebase Auth, Crashlytics and Firestore. The app uses Firebase Authentication to sign in users with Google, Crashlytics to report errors to Firebase and Firestore to store the user's data.

You can enable the firebase emulator to use firebase services locally. To do that, you need to install the firebase emulator suite and run it before running the app. You can find more information about how to do that [here](https://firebase.google.com/docs/emulator-suite).

The port numbers used by the firebase emulator are availble in the [firebase.json](firebase.json) file.

## Modules

The app uses the [BLoC](https://bloclibrary.dev/#/) package to manage state and [Kiwi](https://pub.dev/packages/kiwi) as an IoC container to manage dependencies. The app is divided into modules, each module is a folder that contains the files related to that module. And all the modules are located in the `src` directory.

We have two types of modules: **features** and **core modules**. A **feature** module is a set of components related to a specific feature of the app; and **core modules** holds shared code and app configurations.

Feature modules are located in the `src/features` directory and core modules are located in the `src/`.

### Features

Every feature is composed of three parts or layers:

- Data : contains the data sources and data models
- Logic: contains the blocs and repositories
- Presentation: contains the widgets and screens

Contract between layers are defined by interfaces, following the [Dependency Inversion Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle). The only exception is the presentation layer, which is allowed to depend on the logic layer; and the only component from the logic layer that the presentation layer is allowed to depend on is the bloc or cubit.

### Index files

Public code for every feature in the `features` directory is exported using the `features/features.dart` file. We use the [index_generator](https://pub.dev/packages/index_generator) package to generate index files.

## Features

- [ ] Authentication

  - [x] Sign in with Google
  - [x] Sign out
  - [ ] Sign in with email and password
  - [ ] Reset password

- [x] Crash Reporting

  - [x] Report errors to Firebase Crashlytics
  - [x] Log errors to the console

- [ ] Account Settings
- [ ] Exporting Data to CSV
- [ ] Expense Tracking
- [ ] Expense Categories
- [ ] Expense Reports
- [ ] Expense Templates
- [ ] Expense Recurring
- [ ] Expense Budgets
- [ ] Expense Reminders
- [ ] Expense Tags
