



import 'package:bots_assessment/core/models/goal_stat.dart';
import 'package:bots_assessment/core/providers/football_provider.dart';
import 'package:bots_assessment/core/providers/token_provider.dart';
import 'package:bots_assessment/core/services/football_service.dart';
import 'package:bots_assessment/core/services/token_service.dart';
import 'package:bots_assessment/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

main(){


  test("Token should be null", (){

    GetIt locator2 = GetIt.instance;

    locator2.registerFactory<TokenProvider>(() => TokenProvider());
    locator2.registerLazySingleton<TokenService>(() => TokenService());


    TokenProvider tokenProvider = locator2<TokenProvider>();

    expect(tokenProvider.token, null);

  });


  test("Spanish and italian goal stats array should be empty", (){

    GetIt locator2 = GetIt.instance;

    locator2.registerFactory<FootballProvider>(() => FootballProvider());
    locator2.registerLazySingleton<FootballService>(() => FootballService());

    FootballProvider footballProvider = locator2<FootballProvider>();

    expect(footballProvider.spanishGoalStats, []);

    expect(footballProvider.italianGoalStats, []);

  });





}