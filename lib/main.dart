import 'package:bots_assessment/locator.dart';
import 'package:bots_assessment/ui/views/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp(
        title: 'Bots',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        appBarTheme: Theme.of(context)
        .appBarTheme
        .copyWith(brightness: Brightness.dark),
      ),
      home: Splash(),
    ));
  }
}

