# Starter application

Application with base architecture to start developing new flutter projects.

#### Application support:
- Multi languages.
- Internet connection.
- Many widgets that are ready to use (Like dialogs ..).

#### Some packages should know:
##### To be familiar with this code you should check these packages:
- [Injectable] (Dependency injection).
- [Super enum] (Used at most with the bloc for events and states).
- [Bloc] and [provider] (State management).
- Other important packages you can see in pubspec.yaml.

We use some packages dependent on code generating so before you start (for check), run:
``` 
flutter packages pub run buld_runner build --delete-conflicting-outputs
```

Note: Localization and firebase messaging needs to check the initialization:
- For fcm you need to create new Application and use it from manifest.
- For localization do not forget to define languages in ios info.plist

   [Injectable]: <https://pub.dev/packages/injectable>
   [Super enum]: <https://pub.dev/packages/super_enum>
   [Bloc]: <https://pub.dev/packages/flutter_bloc>
   [provider]: <https://pub.dev/packages/provider>