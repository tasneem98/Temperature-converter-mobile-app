# DevProjects - Temperature Converter Mobile App

This is an open source project from [DevProjects](http://www.codementor.io/projects). Feedback and questions are welcome!
Find the project requirements here: [Temperature converter mobile app](https://www.codementor.io/projects/mobile/temperature-converter-mobile-app-atx32h5e71)

## Tech/framework used
Built with **Flutter** (using the Dart programming language).

## Description
This Flutter application provides a simple and intuitive interface for converting temperatures between Celsius, Kelvin, and Fahrenheit. Users can input a temperature in any of the three units, and the app will instantly calculate and display the corresponding values in the other two units.

## Features
- **Real-time Conversion:** Instantly converts temperatures as the user types.
- **Three Units Supported:** Converts between Celsius, Kelvin, and Fahrenheit.
- **Bi-directional Conversion:** Input in any field updates the other two fields.
    - Celsius to Kelvin and Fahrenheit.
    - Kelvin to Celsius and Fahrenheit.
    - Fahrenheit to Celsius and Kelvin.
- **User-Friendly Interface:** Clear input fields for each temperature unit, distinguished by color and symbol.
- **Customizable Input Fields:** Utilizes a reusable `TemperatureField` widget for consistent UI.

## Screenshots and demo
*(Placeholder: You should add screenshots of your app here. For example, show the app with some values entered and converted.)*

**Example:**

<img src="assets/screenshot_main.png" alt="App Main Screen" width="250"/>
<!-- Add more screenshots if needed -->

<!-- *Link to live demo (if available, e.g., a Flutter Web build or a short video): [Your Demo Link Here]* -->

## Project Structure (within `/lib`)
```
lib/ 
├── app/ 
│   
├── temperature_converter_page.dart 
│   
├── data/ 
│   
│   
└── temerature_type.dart        
│   
└── widgets/ 
│       
└── temperature_field.dart
└── main.dart
```
## How it Works
The core logic resides in `temperature_converter_page.dart`. It uses `TextEditingController` for each temperature unit (Celsius, Kelvin, Fahrenheit). When a user inputs a value in one field:
- The corresponding `onChanged` callback (e.g., `celsiusTemperature`, `kelvinTemperature`, `fahrenheitTemperature`) is triggered.
- These methods calculate the other two temperature values based on standard conversion formulas.
- `setState` is called to update the `TextEditingController.text` property of the other fields, reflecting the new values in the UI.
- The `TemperatureField` widget is a reusable component that takes a `TextEditingController`, display properties (title, symbol, color), and an `onChanged` callback to handle user input.

## Installation
Instructions for other developers on how to install and run your code on their local environment.

### Prerequisites
- **Flutter SDK:** Ensure Flutter is installed on your system. For installation instructions, visit the [official Flutter documentation](https://flutter.dev/docs/get-started/install).
- **IDE:** An Integrated Development Environment like Android Studio (with the Flutter plugin) or Visual Studio Code (with the Flutter extension).
- **Dart SDK:** This is typically bundled with the Flutter SDK.

### Steps to Run
1.  **Clone the repository (if applicable):**
    If the project is hosted on a version control platform like GitHub, clone it to your local machine:

| To convert Fahrenheit to Celsius, we use the formula `**C = (F - 32) / 1.8**`. 
| To convert Fahrenheit to Kelvin, we use the formula `**K = ( F + 459.67 )/1.8**`.

| To convert Celsius to Fahrenheit, we use the formula `**F = 1.8C + 32**`. 
| To convert Celsius to Kelvin, we use the formula `**k = C + 273.15**`. 

| To convert Kelvin to Celsius, we use the formula `**C = K - 273.15**`.
| To convert Kelvin to Fahrenheit, we use the formula `**F = 1.8K - 459.67**`.