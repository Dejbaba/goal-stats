

import 'dart:ui';

import 'package:bots_assessment/core/constants/app_constants.dart';
import 'package:bots_assessment/core/models/goal_stat.dart';
import 'package:bots_assessment/core/providers/football_provider.dart';
import 'package:bots_assessment/ui/views/widgets/custom_horizontal_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///bottom sheet
detailsBottomSheet(BuildContext context, String leagueId){

  showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          ),
        ),
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: Container(
            height: height(context),
            //height: height(context) / 2.3,
            padding: EdgeInsets.only(left: width(context) / 20),
            width: width(context),
            color: Colors.transparent,
            child: Consumer<FootballProvider>(
              builder: (context, provider, child) => SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height(context) / 50),
                      child: Text("Top 20(goals + penalties scored)", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: width(context) / 25
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: CustomHorizontalBarChart(provider.createTop20Data(leagueId),
                        animate: true,),
                    ),
                  ],
                )
              ),

            ),

          ),
        );
      });
}