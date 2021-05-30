

import 'package:bots_assessment/core/enums/viewstate.dart';
import 'package:bots_assessment/core/models/goal_stat.dart';
import 'package:bots_assessment/core/models/responses/goal_stat_response.dart';
import 'package:bots_assessment/core/models/stat_data.dart';
import 'package:bots_assessment/core/providers/base_model.dart';
import 'package:bots_assessment/core/services/football_service.dart';
import 'package:bots_assessment/locator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class FootballProvider extends BaseModel{

  FootballService footballService = locator<FootballService>();


  ///list of goal scorers in Seria-A
  List<GoalStat> _italianGoalStats = [];
  List<GoalStat> get italianGoalStats => _italianGoalStats;

  ///list of goal scorers in La Liga
  List<GoalStat> _spanishGoalStats = [];
  List<GoalStat> get spanishGoalStats => _spanishGoalStats;

  ///list of goal scorers in bundesliga
  List<GoalStat> _germanGoalStats = [];
  List<GoalStat> get germanGoalStats => _germanGoalStats;


  ///fetch italian goal stats
  fetchItalianGoalStats(String token) async{
    setItalianState(ViewState.Busy);
    var _authResp = await footballService.fetchItalianGoalStats(token);
    if (_authResp.containsKey("error")) {
      setItalianState(ViewState.Error);
    } else {
      var response = GoalStatResponse.fromJson(_authResp);
      _italianGoalStats = response.data;
      setItalianState(ViewState.Retrieved);
    }

  }

  ///fetch spanish goal stats
  fetchSpanishGoalStats(String token) async{
    setSpanishState(ViewState.Busy);
    var _authResp = await footballService.fetchSpanishGoalStats(token);
    if (_authResp.containsKey("error")) {
      setSpanishState(ViewState.Error);
    } else {
      var response = GoalStatResponse.fromJson(_authResp);
      _spanishGoalStats = response.data;
      setSpanishState(ViewState.Retrieved);
    }

  }

  ///fetch german goal stats
  fetchGermanGoalStats(String token) async{
    setGermanState(ViewState.Busy);
    var _authResp = await footballService.fetchGermanGoalStats(token);
    if (_authResp.containsKey("error")) {
      setGermanState(ViewState.Error);
    } else {
      var response = GoalStatResponse.fromJson(_authResp);
      _germanGoalStats = response.data;
      setGermanState(ViewState.Retrieved);
    }

  }



  /// Create series list with multiple series
  List<charts.Series<StatData, String>> createTop20Data(String leagueId) {

    //I = SERIA A(italian), S = LA LIGA(spanish), B = BUNDESLIGA(german)

    var goalStat, penaltyStat;

    switch(leagueId.toLowerCase()){
      case "i":
        goalStat = List.generate(_italianGoalStats.length, (index) => new StatData(_italianGoalStats[index].playerName, (_italianGoalStats[index].totalGoals - _italianGoalStats[index].penaltiesScored)));
        penaltyStat = List.generate(_italianGoalStats.length, (index) => new StatData(_italianGoalStats[index].playerName, _italianGoalStats[index].penaltiesScored));
        break;
      case "s":
        goalStat = List.generate(_spanishGoalStats.length, (index) => new StatData(_spanishGoalStats[index].playerName, (_spanishGoalStats[index].totalGoals - _spanishGoalStats[index].penaltiesScored)));
        penaltyStat = List.generate(_spanishGoalStats.length, (index) => new StatData(_spanishGoalStats[index].playerName, _spanishGoalStats[index].penaltiesScored));
        break;
      case "b":
        goalStat = List.generate(_germanGoalStats.length, (index) => new StatData(_germanGoalStats[index].playerName, (_germanGoalStats[index].totalGoals - _germanGoalStats[index].penaltiesScored)));
        penaltyStat = List.generate(_germanGoalStats.length, (index) => new StatData(_germanGoalStats[index].playerName, _germanGoalStats[index].penaltiesScored));

    }

    return [
      new charts.Series<StatData, String>(
        id: 'Goal',
        domainFn: (StatData sales, _) => sales.playerName,
        measureFn: (StatData sales, _) => sales.stat,
        data: goalStat,
      ),
      new charts.Series<StatData, String>(
        id: 'Penalty',
        domainFn: (StatData sales, _) => sales.playerName,
        measureFn: (StatData sales, _) => sales.stat,
        data: penaltyStat,
      ),
      /* new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),*/
    ];
  }


}