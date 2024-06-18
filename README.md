# Business Manager

Business Manager is a mobile application designed to help manage customers, suppliers, and branches efficiently. This app is built using Flutter and leverages the Provider package for state management.

## Features

- **Branch Management:** Add, update, delete, and view branches.
- **Customer and Supplier Management:** Add, update, delete, and view customers and suppliers associated with branches.
- **Transaction Management:** View transactions associated with customers and suppliers.

## Screens

- **Branch List Screen:** Displays a grid of branches.
- **Customer/Supplier List Screen:** Displays a list of customers or suppliers for a selected branch.
- **Customer/Supplier Create Screen:** Form to add new customers or suppliers.
- **Customer/Supplier Update Screen:** Form to update existing customers or suppliers.
- **Transaction List Screen:** Displays transactions for a selected customer or supplier.

## Architecture

The app follows the Clean Architecture principles combined with the MVVM (Model-View-ViewModel) pattern to ensure a scalable, maintainable, and testable codebase.

### Layers

1. **Presentation Layer:**
   - **UI:** Contains all the UI code and widgets.
   - **ViewModel:** Manages the state and handles user interactions, communicating with the domain layer.

2. **Domain Layer:**
   - **Entities:** Basic data objects used across the application.
   - **Use Cases:** Encapsulates business logic and interacts with the repository to fetch/update data.

3. **Data Layer:**
   - **Models:** Data models for API responses.
   - **Repositories:** Interfaces defining data operations.
   - **Data Sources:** Implements data operations, fetching data from network or local database.

### MVVM Pattern

- **Model:** Represents the data and business logic.
- **View:** Displays the data (UI).
- **ViewModel:** Acts as a mediator between the Model and the View, handling presentation logic and state management.

### Project Structure

- **lib/**
  - **model/**
    - **core/**: Core utility classes and constants.
    - **helper/**: Helper classes and functions.
  - **modules/**
    - **admin/**
      - **model/**
        - **core/**
          - **service/**
            - **remote/**: Contains remote data source implementations.
          - **response_model/**: Data models for API responses.
          - **request_model/**: Data models for API requests.
      - **view/**: Contains admin-related UI screens and widgets.
      - **viewModel/**: Contains ViewModels for admin module.
    - **auth/**
      - **model/**: Contains models for authentication module.
      - **view/**: Contains authentication-related UI screens and widgets.
      - **viewModel/**: Contains ViewModels for authentication module.
    - **branch/**
      - **model/**: Contains models for branch module.
      - **view/**: Contains branch-related UI screens and widgets.
      - **viewModel/**: Contains ViewModels for branch module.
    - **customer/**
      - **model/**: Contains models for customer module.
      - **view/**: Contains customer-related UI screens and widgets.
      - **viewModel/**: Contains ViewModels for customer module.
    - **transaction/**
      - **model/**: Contains models for transaction module.
      - **view/**: Contains transaction-related UI screens and widgets.
      - **viewModel/**: Contains ViewModels for transaction module.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter installation

- You can download the latest APK from the link below:




### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/AAShayon/Buisness-Manager.git
   cd business_manager
Configuration
Update the API endpoints and other configurations in lib/model/core/api_urls.dart.

#Dependencies

----provider

----dio

---flutter_screenutil

---intl

---connectivity


APK Download
Download [Business Manager APK](https://drive.google.com/drive/folders/1v8IfzyHsh1FydTmpE9fm0uBjBvjXxtSH?usp=drive_link)
