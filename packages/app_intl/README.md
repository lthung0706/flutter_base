# ez intl

Please be very careful editing code in this directory. Similarly, don't add code to this directory until you are sure it has genuine usefulness and you have cleaned up & tested it.

# usage
You can use it by adding a dependency in your pubspec.yaml file:

dependencies:
  app_intl:
    path: ../ez_core/app_intl

and add some code below into material app to finish setup:
```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: AppLocale.localeEn,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
Weldone :))

we can get value of appName: Applocalizations.of(context).appName

```