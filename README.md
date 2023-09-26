# coin_tracker_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Running the project

 First of all, you have to create a new file in the root folder called "keys.json" and add your Coinapi.io APIKEY as:

{
    "coinAPIKEY": "YOUR_API_KEY"
}

and add "--dart-define-from-file=api-keys.json" when calling "flutter run".

The next step is to generate the necessary code to run the app with:

dart run build_runner build --delete-conflicting-outputs

Finally you can run the app with "flutter run --dart-define-from-file=api-keys.json"

## Packages

This project uses the following packages:
    - go_router (^10.1.2): To navigate through screens in a declarative way.
    - provider (^6.0.5): To share data between multiple screens.
    - responsive_sizer: (^3.2.0): To build UI for every device screen size.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
