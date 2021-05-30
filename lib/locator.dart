
import 'package:bots_assessment/core/providers/bottom_nav_provider.dart';
import 'package:bots_assessment/core/providers/football_provider.dart';
import 'package:bots_assessment/core/providers/token_provider.dart';
import 'package:bots_assessment/core/services/football_service.dart';
import 'package:bots_assessment/core/services/token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';



GetIt locator = GetIt.instance;

void setupLocator() {

/// register services
  locator.registerLazySingleton<TokenService>(() => TokenService());
  locator.registerLazySingleton<FootballService>(() => FootballService());
  //locator.registerLazySingleton<LocalNotificationService>(() => LocalNotificationService());


/// register models
  locator.registerFactory<TokenProvider>(() => TokenProvider());
  locator.registerFactory<FootballProvider>(() => FootballProvider());
  locator.registerFactory<BottomNavProvider>(() => BottomNavProvider());



}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => TokenProvider()),
  ChangeNotifierProvider(create: (_) => FootballProvider()),
  ChangeNotifierProvider(create: (_) => BottomNavProvider()),

];