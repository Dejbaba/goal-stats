import 'dart:async';

import 'package:bots_assessment/core/constants/app_constants.dart';
import 'package:bots_assessment/core/enums/viewstate.dart';
import 'package:bots_assessment/core/providers/token_provider.dart';
import 'package:bots_assessment/core/utils/navigations.dart';
import 'package:bots_assessment/ui/views/pages/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';


class Splash extends StatefulWidget {


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  TokenProvider tokenProvider;

  @override
  void initState() {

    super.initState();

    ///init Token Provider
    tokenProvider = Provider.of<TokenProvider>(context, listen: false);


    SchedulerBinding.instance.addPostFrameCallback((_){

      ///fetch token
      tokenProvider.fetchAccessToken().then((onValue) {
        print("value: $onValue-----");
        if(onValue){
          Timer(
              const Duration(seconds: 3),
                  () =>  Navigations.replaceAndTransitTo(context, BottomNav()));
        }
      });

    });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(bottom: height(context) / 30),
        height: height(context),
        width: width(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo.png"), fit: BoxFit.contain,
            )
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
            child: Consumer<TokenProvider>(
              builder: (context, provider, child){
                switch(provider.state){
                  case ViewState.Busy:
                    return CircularProgressIndicator();
                    break;
                  case ViewState.Error:
                    return ElevatedButton(
                      child: Text('Error Occurred. Please Try again', style: TextStyle(
                          fontSize: width(context) / 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () => provider.fetchAccessToken().then((onValue) {
                        print("value: $onValue-----");
                        if(onValue){
                          Timer(
                              const Duration(seconds: 3),
                                  () =>  Navigations.replaceAndTransitTo(context, BottomNav()));
                        }
                      }),
                    );
                    break;
                  case ViewState.Retrieved:
                  default:
                    return Container();

                }
              },
            )),
      ),
    );
  }


}
