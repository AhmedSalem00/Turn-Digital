To add details about **location** and the **latest SDK** version in your README file, we will update the relevant sections to reflect these changes.

Here’s an updated version of your README with added information about location services and the latest SDK:

---
![Image](https://github.com/user-attachments/assets/af93900b-6907-4185-bdff-13ec8ba52f47) ![Image](https://github.com/user-attachments/assets/58c886e4-1ff0-41a9-9ae6-2c2b826a591e)

![Image](https://github.com/user-attachments/assets/9f5e1171-2a1d-46de-9a8e-04c119a7c2eb)
![Image](https://github.com/user-attachments/assets/7b7e793a-52f9-4a07-a3b7-d3dccab3d69b)
![Image](https://github.com/user-attachments/assets/b8b040df-75ef-42f7-93f4-0b17d046b6e4)
![Image](https://github.com/user-attachments/assets/b88fa96b-16ca-4414-a9d2-3b7f8d76b6ed)

![Image](https://github.com/user-attachments/assets/155bc1f4-8948-4236-b580-e73010d27b5d)
![Image](https://github.com/user-attachments/assets/f1860b15-04bf-442b-883e-4814be544440)
![Image](https://github.com/user-attachments/assets/cd0ce398-5273-445d-9f7e-d68feb7c5e13)
![Image](https://github.com/user-attachments/assets/c26be3ad-8ee8-422f-8c66-859f5bb67e91)
![Image](https://github.com/user-attachments/assets/555ae469-1265-4064-9d13-9ff290e8fa64)

# Booking Application

This Flutter project is a **Booking Application** that offers users a seamless way to view, book, and manage events, services, or appointments. It provides a smooth and responsive user experience with advanced state management and local storage features.

## SDK Version

This project is built with the latest stable **Flutter SDK** version. Ensure you're using the latest Flutter version to guarantee compatibility with all dependencies.

**Latest SDK Version**:  
Make sure to use Flutter version **3.29.0x** or higher for compatibility with all dependencies and features.

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

- **Geolocation & Permissions**:  
   The app uses `geolocator`, `geocoding`, and `permission_handler` to manage location services. This includes:
   - **Geolocation**: Get the user's current location (latitude and longitude).
   - **Geocoding**: Convert coordinates into human-readable addresses.
   - **Permissions**: Request and manage permissions for accessing location services.

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
- **share_plus**: For sharing content via social media platforms.
- **geolocator**: For geolocation services, including fetching the device's current location.
- **geocoding**: For reverse geocoding, converting coordinates into addresses.
- **permission_handler**: For requesting permissions to access location and other services.
- **flutter_local_notifications**: For scheduling and displaying local notifications.
- **timezone**: For managing time zones and adjusting notifications accordingly.

---

## Contributing

We welcome contributions to this project! To contribute:

1. **Fork the repository** to your own GitHub account.
2. **Create a new branch**: `git checkout -b feature-name`.
3. **Make your changes**: Add a new feature or fix a bug.
4. **Commit your changes**: `git commit -am 'Add new feature'`.
5. **Push to your branch**: `git push origin feature-name`.
6. **Create a pull request**: Describe the changes you’ve made and submit it for review.

---

## License

This project is licensed under the **MIT License** - see the [LICENSE.md](LICENSE.md) file for details.

---

This updated README now includes details about **location** functionality and mentions the **latest SDK** version required for the project. Let me know if you need any further modifications!
