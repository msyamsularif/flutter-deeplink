# Flutter Deeplink

This project contains how to implement deeplinks with Flutter on the Android platform. For implementation details, you can read and follow the [Flutter](https://docs.flutter.dev/ui/navigation/deep-linking) and [Android](https://developer.android.com/training/app-links/deep-linking) documentation.

## Tech

The Flutter deeplink project uses an open source package found on pub.dev, namely the [go_router](https://pub.dev/packages/go_router) package to implement routing in Flutter.

## Installation

To ensure the deeplink works, you can do it in several ways. First, run the following command in the project terminal
```sh
adb shell 'am start -W -a android.intent.action.VIEW \
           -c android.intent.category.BROWSABLE \
           -d "https://apaajakek.000webhostapp.com/details"'
```

or you can directly click the link that is registered in the **AndroidManifest.xml** file on the device that has this project installed. In this example project, you can directly click the following link **https://apaajakek.000webhostapp.com/details**