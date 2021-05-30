
import 'package:bots_assessment/core/services/http_helpers/open_client.dart';
import 'package:bots_assessment/core/services/http_helpers/secure_client.dart';

class FootballService{

  ///fetch italian goal stat
  Future<Map<String, dynamic>> fetchItalianGoalStats(String token) async {
    final _data = await SecureClient(token: token).get(
      url: "https://football.elenasport.io/v2/seasons/3241/topscorers",

    );
    print('Message from Italian Goal Stats: $_data');
    return _data;
  }

  ///fetch spanish goal stat
  Future<Map<String, dynamic>> fetchSpanishGoalStats(String token) async {
    final _data = await SecureClient(token: token).get(
      url: "https://football.elenasport.io/v2/seasons/3229/topscorers",

    );
    print('Message from Spanish Goal Stats: $_data');
    return _data;
  }

  ///fetch german goal stat
  Future<Map<String, dynamic>> fetchGermanGoalStats(String token) async {
    final _data = await SecureClient(token: token).get(
      url: "https://football.elenasport.io/v2/seasons/3218/topscorers",

    );
    print('Message from German Goal Stats: $_data');
    return _data;
  }
}