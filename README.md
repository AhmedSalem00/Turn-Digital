

# Booking Application

This Flutter project is a **Booking Application** that offers users a seamless way to view, book, and manage events, services, or appointments. It provides a smooth and responsive user experience with advanced state management and local storage features.

## SDK Version

This project is built with the latest stable **Flutter SDK** version. Ensure you're using the latest Flutter version to guarantee compatibility with all dependencies.

## Installation & Setup

To get started with the project, follow these simple steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/AhmedSalem00/your-repo.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd booking_application
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

---

## Features

- **Splash Screen**: The app uses `flutter_native_splash` to display a custom splash screen on launch, providing a branded startup experience.
  
- **Responsive UI**: With `flutter_screenutil`, the app ensures adaptive screen sizes and font scaling, allowing the app to look great on all device sizes.

- **Custom Fonts**: `google_fonts` enables the use of custom fonts from Google Fonts to improve the app's design and aesthetics.

- **Image Caching**: `cached_network_image` ensures efficient image loading and caching for better performance and reduced load times.

- **Rich UI Elements**: The app utilizes `font_awesome_flutter` for icons and `flutter_svg` for SVG rendering, making it possible to display scalable vector graphics (SVGs) alongside traditional icons.

- **Networking**: API requests are made using `dio`, ensuring efficient and optimized handling of HTTP requests.

- **State Management**: The app leverages `flutter_bloc` for state management, following the **BLoC** (Business Logic Component) pattern. This results in a clear separation of concerns and a more maintainable codebase.

- **Value Equality**: `equatable` is used for efficient object comparison, making it easier to handle immutable data models and state updates.

- **Localization & Date Formatting**: `intl` is used for internationalization (i18n), allowing for multi-language support, and formatting of dates and numbers according to the user's locale.

- **Dependency Injection**: `get_it` implements the **service locator pattern** to manage dependencies and improve code structure and maintainability.

- **Storage**: `shared_preferences` is used for local storage, making it simple to save user preferences and other lightweight data.

- **Content Sharing**: `share_plus` is integrated to allow users to share content like booking details or promotions via different social media platforms.

- **Geolocation & Permissions**: `geolocator`, `geocoding`, and `permission_handler` are used for location-based services, including geolocation tracking, reverse geocoding, and requesting user permissions.

- **Notifications**: `flutter_local_notifications` allows the app to schedule and display notifications, ensuring users stay informed about their bookings and upcoming events.

- **Timezone Management**: `timezone` helps manage different time zones and ensures that users receive notifications at the correct time, regardless of their time zone.

---

## State Management

This project uses **BLoC (Business Logic Component)** for managing state. BLoC helps separate the business logic from the UI, ensuring that the code is easier to maintain and test.

**flutter_bloc** is the primary package used for implementing the BLoC pattern. By using this pattern, the app achieves:

- **Separation of Concerns**: Logic is handled separately from UI code, making it easy to manage and test.
- **Scalability**: The app can scale easily by adding more features without major changes to the core structure.
- **Testability**: BLoC allows for easier unit testing, ensuring the app's logic works correctly under different conditions.

---

## Dependencies

The following dependencies are used in this project:

- **flutter_native_splash**: For creating a custom splash screen.
- **flutter_screenutil**: For responsive UI design and adaptive screen sizes.
- **google_fonts**: To use Google Fonts in the app.
- **cached_network_image**: For image caching and optimization.
- **font_awesome_flutter**: To include rich icons in the app.
- **flutter_svg**: For displaying SVG files in the app.
- **dio**: For making HTTP requests and API communication.
- **flutter_bloc**: For state management using the BLoC pattern.
- **equatable**: For value equality comparisons.
- **intl**: For localization and date formatting.
- **get_it**: For dependency injection using the service locator pattern.
- **shared_preferences**: For storing lightweight data locally.
- **share_plus**: For sharing content
