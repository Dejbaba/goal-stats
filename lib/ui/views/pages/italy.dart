import 'package:bots_assessment/core/constants/app_constants.dart';
import 'package:bots_assessment/core/enums/viewstate.dart';
import 'package:bots_assessment/core/providers/football_provider.dart';
import 'package:bots_assessment/core/providers/token_provider.dart';
import 'package:bots_assessment/locator.dart';
import 'package:bots_assessment/ui/views/widgets/bottom_sheet.dart';
import 'package:bots_assessment/ui/views/widgets/custom_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class Italy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _ItalyState();
  }


}

class _ItalyState extends State<Italy>{

 FootballProvider footballProvider;
 TokenProvider tokenProvider;


  @override
  void initState() {

    super.initState();

    ///init football provider
    footballProvider = Provider.of<FootballProvider>(context, listen: false);

    ///init token provider
    tokenProvider = Provider.of<TokenProvider>(context, listen: false);


    SchedulerBinding.instance.addPostFrameCallback((_){

      ///fetch italian goal stats
      footballProvider.fetchItalianGoalStats(
          tokenProvider.token
      );

    });




  }


  @override
  Widget build(BuildContext context) {

    return Container(
      height: height(context),
      width: width(context),
      child: SafeArea(child: Consumer<FootballProvider>(
        builder: (context, provider, child){
          switch(provider.italianState){
            case ViewState.Busy:
              return Center(
                child: CircularProgressIndicator(),
              );
             break;
            case ViewState.Retrieved:
              return Stack(
                children: [
                CustomBarChart(
                goalStats: provider.italianGoalStats,
              ),
                  Positioned(
                    right: width(context) / 20,
                    top: height(context) / 60,
                    child: ElevatedButton(
                      key: const ValueKey("see_more"),
                      child: Text('Show top 20', style: TextStyle(
                            fontSize: width(context) / 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        detailsBottomSheet(context, "I");
                      },
                    ),
                  ),
                ],
              );
              break;
            case ViewState.Error:
              return Center(
                child: ElevatedButton(
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
                  onPressed: () => provider.fetchItalianGoalStats(
                    tokenProvider.token
                  )),
              );
              break;
            default:
              return Container();

          }
        },
         )),
    );
  }


}