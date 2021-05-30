


import 'package:bots_assessment/core/services/http_helpers/open_client.dart';


class TokenService{

  ///fetch token
  Future<Map<String, dynamic>> fetchToken() async {
    final _data = await OpenClient().post(
      body: {"grant_type": "client_credentials"},
      url: "https://oauth2.elenasport.io/oauth2/token",
      addAuth: true
    );
    print('Message from Fetch token: $_data');
    return _data;
  }



}