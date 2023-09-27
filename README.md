
# coin_tracker_app

  

This project is a cryptocurrency tracking app made with flutter that consumes coinapi.io REST API.

It was develped following TDD + ChangeNotifier + Provider in a Clean Architecture implementation for Flutter.

  
  

## Running the project

  

First of all, you have to create a new file in the root folder called "keys.json" and add your Coinapi.io APIKEY as:

	{
	"coinAPIKEY": "YOUR_API_KEY"
	}


and add "--dart-define-from-file=api-keys.json" when calling "flutter run".

	flutter run --dart-define-from-file=api-keys.json

The next step is to generate the necessary code to run the app with:

  
    dart run build_runner build --delete-conflicting-outputs 


Finally you can run the app with "flutter run --dart-define-from-file=api-keys.json"

  

## Tests
To run all the test for this project, run the following:

    flutter test --dart-define-from-file=keys.json 

## Packages

 
This project uses the following packages:

- go_router (^10.1.2): To navigate through screens in a declarative way.
- provider (^6.0.5): To share data between multiple screens.
- responsive_sizer: (^3.2.0): To build UI for every device screen size.
- get_it: (^7.6.4): To Inject Dependencies
- candlesticks: (^2.1.0): It provides a interactive candlestick chart to display assets prices.

