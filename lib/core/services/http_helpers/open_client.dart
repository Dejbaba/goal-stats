import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as inner;

class OpenClient{

  Future<Map<String, dynamic>> post({dynamic body, String url, bool addAuth = false}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      if(addAuth)
      HttpHeaders.authorizationHeader: 'Basic MnNqamx1OGtrYmhkNjdxdXNpNDlwM2cxYW86MWFwNGExZjg2M3Q2dDQ3djI0YWk5Y2x1MXA2djJ1azc0bmVncXIxczl2NmVyNjMyZTE4dQ=='
    };
    try {
      print(url);
      final inner.IOClient _client = getClient();
      http.Response res = await _client.post(url, headers: headers, body: body);
      print("Body: $body");
      print("Response Code: " + res.statusCode.toString());
      print("Response Body: " + res.body.toString());
      if(res.statusCode >= 500 || res.statusCode == 404){
        return {"error": true, "message": "Internal Server Error"};
      }else{
        Map<String, dynamic> response = jsonDecode(res.body);
        return response;
      }

    } catch (e) {
      return {"error": true, "message": e.message};
    }
  }

  Future<Map<String, dynamic>> get({String url}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };

    try {
      print(url);
      final inner.IOClient _client = getClient();
      http.Response res = await _client.get(url, headers: headers);
      print("Response Code: " + res.statusCode.toString());
      print("Response Body: " + res.body.toString());
      if(res.statusCode >= 500 || res.statusCode == 404){
        print("Server Error...");
        return {"error": true, "message": "Internal Server Error"};
      }else{
        Map<String, dynamic> response = jsonDecode(res.body);
        return response;
      }
    } catch (e) {
      print("error occurred on connecting ----");
      return {"error": true, "message": e.message};
    }
  }

  Future<Map<String, dynamic>> put({dynamic body, String url}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };

    try {
      print(url);
      final inner.IOClient _client = getClient();
      http.Response res = await _client.put(url, headers: headers, body: body);
      print("Body: $body");
      print("Response Code: " + res.statusCode.toString());
      print("Response Body: " + res.body.toString());
      if(res.statusCode >= 500 || res.statusCode == 404){
        print("Server Error...");
        return {"error": true, "message": "Internal Server Error"};
      }else{
        Map<String, dynamic> response = jsonDecode(res.body);
        return response;
      }

    } catch (e) {
      print("error occurred on connecting ----");
      return {"error": true, "message": e.message};
    }
  }

  Future<Map<String, dynamic>> delete({String url}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };

    try {
      print(url);
      final inner.IOClient _client = getClient();
      http.Response res = await _client.delete(url, headers: headers);
      print("Response Code: " + res.statusCode.toString());
      print("Response Body: " + res.body.toString());
      if(res.statusCode >= 500 || res.statusCode == 404){
        print("Server Error...");
        return {"error": true, "message": "Internal Server Error"};
      }else{
        Map<String, dynamic> response = jsonDecode(res.body);
        return response;
      }
    } catch (e) {
      print("error occurred on connecting ----");
      return {"error": true, "message": e.message};
    }
  }

  ///can be used for file upload to the server
  Future<Map<String, dynamic>> multiPartRequest({String url, String field, dynamic fileName, Map<String, String> data, String requestType = "POST"}) async{


    var request = http.MultipartRequest(requestType, Uri.parse(url));
    request.headers.addAll({
      "content-type":"application/json"
    },);
    request.files.add(await http.MultipartFile.fromPath(field, fileName));
    if(data != null)
      request.fields.addAll(data);

    try {
      print(url);
      var _data = await request.send();
      http.Response res = await http.Response.fromStream(_data);
      print("status code from multi-path: ${res.statusCode}");
      print("Response from multi-path: ${res.body}");
      print("Response from multi-path ----: $res");
      if(res.statusCode >= 500 || res.statusCode == 404){
        print("Server Error...");
        return {"error": true, "message": "Internal Server Error"};
      }else{
        Map<String, dynamic> response = jsonDecode(res.body);
        return response;
      }
    } catch (e) {
      print("error occurred on connecting ----");
      return {"error": true, "message": e.message};
    }
  }





  inner.IOClient getClient() {
    bool trustSelfSigned = true;
    HttpClient httpClient = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => trustSelfSigned);
    inner.IOClient ioClient = new inner.IOClient(httpClient);
    return ioClient;
  }
}
