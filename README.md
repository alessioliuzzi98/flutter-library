# flutter_library

Inventory management of a library, written in Flutter.

<a href="https://ibb.co/WcBc03R"><img src="https://i.ibb.co/NLWLr3G/Screenshot-main-page.png" width="250" alt="Screenshot-main-page" border="0"></a>
<a href="https://ibb.co/W0pGg8V"><img src="https://i.ibb.co/ypBdWv4/Screenshot-detail-page.png" width="250" alt="Screenshot-detail-page" border="0"></a>

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
