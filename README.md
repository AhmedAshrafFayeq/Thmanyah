#  Thmanyah Project

## Overview

This project implements the **Thmanyah Task** application using a modular architecture. It leverages the **MVVM (Model-View-ViewModel)** pattern and supports scalable, testable, and maintainable code. The app features a structured flow, including data fetching, presentation, and UI integration.

---

## Project Structure

The project is organized into the following directories:

### 1. **Thmanyah**

The main application code resides in this module, which includes:

#### Core:
Core utilities and foundational classes for networking, API handling, and navigation.
- **API**: Handles API-related constants and configurations.
- **Network**: Contains network-related utilities (e.g., HTTP requests).
- **Coordinator**: Manages navigation flows.
- **ThamanyiaNavigation**: Defines the navigation structure for the app.

#### Modules:
Contains feature-specific modules (e.g., Home, Authentication). Each module is split into the following submodules:
- **Data**: Handles data-related logic (e.g., repositories, remote calls, and data mapping).
- **Domain**: Defines the business logic, use cases, and entities.
- **Presentation**: Handles UI components, flows, and view models.
- **Localization**: Handles language resources for the module.

#### SharedUI:
- Contains reusable UI components (e.g., loader components).

#### Resources:
- Includes assets (e.g., images, fonts, and localization files).

---

### 2. **Tests**

Contains unit and UI test cases to validate functionality:

#### ThmanyahTests:
- Unit tests for core modules and features.
  - **Mock**: Mock classes like `MockHomeUseCase`.
  - **Presentation**: Tests for `HomeViewModel`.

#### ThmanyahUITests:
- UI tests to validate app functionality and user flows.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedAshrafFayeq/Thmanyah.git
   ```

2. Open the project in Xcode:
   ```bash
   open Thmanyah.xcodeproj
   ```

3. Ensure you have the required dependencies installed:
   - **Swift 6.x**
   - **Xcode 26.0.1**

4. Build the project:
   - Select the appropriate scheme.
   - Press `Cmd + B` to build the app.

---

## Features

### 1. Home Module
- Displays a list of content sections.
- Each section may include:
  - **Big Square Views**
  - **Queues**
  - **Two-Line Grids**

### 2. Localization
- The app supports multi-language capabilities.
- Language resources are managed within the `Localization` submodules.

### 3. Shared UI Components
- Contains reusable UI elements like loaders and buttons for consistent design.

---

## Running Tests

### Run Unit Tests:
1. Go to the `ThamanyiaTaskTests` target in Xcode.
2. Press `Cmd + U` to run all unit tests.

### Run UI Tests:
1. Go to the `ThamanyiaTaskUITests` target in Xcode.
2. Execute UI tests to validate navigation and UI flows.

---

## Folder Structure

Here’s a summary of the folder structure for better understanding:

```
Thmanyah
│
├── Application
│   └── AppDelegate.swift
│
├── Core
│   ├── API
│   ├── Coordinator
│   ├── Network
│   └── Helper
│
├── Modules
│   ├──  Home
│   │    ├── Models
│   │    ├── Views
│   │    ├── View Model
│   ├──  Splash
│   └──  Shared UI
│
└── Resources
    ├── Fonts
    ├── Colors
    └── Assets
```

---

## Contact

For any inquiries or issues, please reach out to **ahmedashraffayeq@gmail.com**.

---
