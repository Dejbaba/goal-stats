
import 'dart:async';


import 'package:bots_assessment/core/constants/app_constants.dart';
import 'package:bots_assessment/core/providers/bottom_nav_provider.dart';
import 'package:bots_assessment/ui/views/pages/italy.dart';
import 'package:bots_assessment/ui/views/pages/spain.dart';
import 'package:bots_assessment/ui/views/widgets/custom_bar_chart.dart';
import 'package:bots_assessment/ui/views/widgets/exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'germany.dart';

class BottomNav extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _BottomNav();
  }


}

class _BottomNav extends State<BottomNav>{


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async => exitApp(context),
        child: Consumer<BottomNavProvider>(
          builder: (context, provider, child) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    title: Text(
                      "Goal Statistics"
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                      onTap: (index) =>  provider.onTabTapped(index),
                      elevation: 0,
                      backgroundColor: Colors.teal,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.white,
                      selectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w900
                      ),
                      unselectedItemColor: Colors.black.withOpacity(0.2),
                      currentIndex: provider.currentIndex,
                      items:

                      [
                        BottomNavigationBarItem(
                          activeIcon: new Icon(Icons.sports_soccer, size: height(context) / 25, color: Colors.white,),
                          icon: new Icon(Icons.sports_soccer, size: height(context) / 25, color: Colors.black.withOpacity(0.2),),
                          label: 'Seria A',

                        ),
                        BottomNavigationBarItem(
                          activeIcon: new Icon(Icons.sports_soccer, size: height(context) / 25, color: Colors.white,),
                          icon: new Icon(Icons.sports_soccer, size: height(context) / 25, color: Colors.black.withOpacity(0.2),),
                          label: 'La Liga',
                        ),
                        BottomNavigationBarItem(
                          activeIcon: new Icon(Icons.sports_soccer, size: height(context) / 25, color: Colors.white,),
                          icon: new Icon(Icons.sports_soccer, size: height(context) / 25, color: Colors.black.withOpacity(0.2),),
                          label: 'Bundesliga',
                        ),
                      ],
                    ),
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    top: true,
                    child: IndexedStack(
                        index: provider.currentIndex,
                        children: provider.children),
                  )// opens the currently selected screen
              ),
        ));
  }

}

