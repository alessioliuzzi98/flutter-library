# flutter_library

Inventory management of a library, written in Flutter.

## How to use it
Retrieve the dependencies with the following command:
```terminal
fvm flutter pub get
```

Then run the build_runner to automatically generate support files:
```terminal
fvm flutter pub run build_runner build --delete-conflicting-outputs 
```

Run the application and.. enjoy it!

## Architecture
* BLoC pattern
* Dependency Injection with Provider
* Simplified with Freezed
* Supports both Portrait and Landscape orientations
* Unit tests
