

import 'package:bots_assessment/core/enums/viewstate.dart';
import 'package:bots_assessment/core/models/goal_stat.dart';
import 'package:bots_assessment/core/models/responses/goal_stat_response.dart';
import 'package:bots_assessment/core/services/token_service.dart';
import 'package:bots_assessment/locator.dart';

import 'base_model.dart';

class TokenProvider extends BaseModel{

  TokenService tokenService = locator<TokenService>();

  String _token;
  String get token => _token;






  ///fetch access token
  Future<bool> fetchAccessToken() async{
    setState(ViewState.Busy);
    var _authResp = await tokenService.fetchToken();
    if (_authResp.containsKey("error")) {
      setState(ViewState.Error);
      return false;
      _token = _authResp["access_token"];
      /*///fetch italian goal stats
      await fetchItalianGoalStats(token: _token);*/
    }else{
      _token = _authResp["access_token"];
      setState(ViewState.Retrieved);
      return true;
    }

  }








}