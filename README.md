# Shop_KT

A new Flutter project for an online shop.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## Introduction
Shop_KT is a new Flutter project designed for building an online shop application. This project utilizes various Flutter plugins to enhance functionality and provide a seamless user experience.

## Features
- **User Authentication**: 
  - Login
  - Register
  - Logout
- **Shopping Cart**: 
  - Add products to cart
  - Remove products from cart
  - Adjust product quantities
- **Product Details**: View detailed information about each product.
- **Checkout**: Perform checkout and integrate with banking services for payments.
- **Product Display**: Browse and search for products.
- **User Profile**: View and edit user profile information.

## Installation

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)

### Steps

1. Clone the repository:
    ```bash
    git clone https://github.com/kkiet-dev/MobileApp.git
    cd MobileApp
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Configure Firebase (optional if you plan to use Firebase):
    - Download `google-services.json` from Firebase Console and place it in `android/app`.

4. Run the application:
    ```bash
    flutter run
    ```

## Usage

1. Open the application.
2. The app will check the login status.
3. If logged in, proceed to the main features of the app:
   - Browse and search for products.
   - Add products to cart.
   - View product details.
   - Proceed to checkout and make payments.
   - View and edit user profile.

## Configuration

### Dependencies

Ensure the following dependencies are added in `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  crypto: ^3.0.3
  http: ^1.2.0
  carousel_slider: ^5.0.0
  shared_preferences: ^2.1.0
